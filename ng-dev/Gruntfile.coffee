'use strict'

path = require 'path'
lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet

folderMount = (connect, point) ->
  connect.static(path.resolve(point))

module.exports = (grunt) ->
  ngSeedConfig =
    slipstream: true

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    ###
    # Sets up the live reload server
    ###
    connect:
      livereload:
        options:
          middleware: (connect, options) ->
            [lrSnippet, folderMount(connect, "../public")]

    ###
    # Sets up CoffeeScript compilation.
    # Compiles all scripts under /scripts into the temp-folder
    # and all files under test in place.
    ###
    coffee:
      app:
        expand: true
        cwd:    './app/scripts'
        src:    ['**/*.coffee']
        dest:   './temp/scripts'
        ext:    '.js'

      test:
        expand: true
        cwd:    './test'
        src:    ['**/*.coffee']
        dest:   './temp/test'
        ext:    '.js'

    ###
    # Coffee Lint options, see http://www.coffeelint.org for all available options
    ###
    coffeelintOptions:
      no_trailing_whitespace:
        level: "error"
      no_tabs:
        level: "error"
      indentation:
        value: 2
        level: "error"
      line_endings:
        value: "unix"
        level: "warn"
      max_line_length:
        value: 80
        level: "warn"

    coffeelint:
      app:    ['scripts/**/*.coffee']
      tests:  ['test/**/*.coffee']

    ###
    # Sets up LESS compilation.
    # Compiles all less-files under /styles not named _{whatever}.less
    ###
    less:
      dev:
        files: [
          expand: true
          cwd:    './app/styles'
          src:    ['**/*.less', '!**/_*.less']
          dest:   './temp/styles'
          ext:    '.css'
        ]

    ###
    # NOTE: If you want, you can use the wildcard notation to catch all
    # .css-files under temp/styles, but with css-concatenation the order
    # of the files is more often than not important.
    ###
    mincss:
      compress:
        files: [
            src:  ['./temp/styles/main.css', './temp/styles/greeter.css']
            dest: './dist/styles/styles.min.css'
          ]

    ###
    # Tries its best to minimize image file size without lossy compression
    ###
    imagemin:
      prod:
        options:
          optimizationLevel: 3,
        files: [
          expand: true
          cwd:    './app/images'
          src:    ['**/*.png', '**/_*.jpg']
          dest:   './dist/images'
        ]
      dev:
        options:
          optimizationLevel: 0,
        files: [
          expand: true
          cwd:    './app/images'
          src:    ['**/*.png', '**/_*.jpg']
          dest:   './temp/images'
        ]

    ###
    # NOTE: Since play's public folder is outside of grunt cwd (ng-dev)
    # it can't clean that directory. Just know that you might need to do
    # that manually if you remove source files.
    ###
    clean:
      dev:
        src: ['./temp/']
      prod:
        src: ['./dist/']

    copy:
      scripts:
        files: [
          expand: true
          cwd:    './app/scripts'
          src:    ['**/*.js']
          dest:   './temp/scripts'
        ]
      test:
        files: [
          expand: true
          cwd:    './test'
          src:    ['**/*.js']
          dest:   './temp/test'
        ]
      playAll:
        files: [{
          expand: true
          cwd:    './temp/'
          src:    ['**/*.*']
          dest:   '../public'
        }, {
          expand: true
          cwd:    './dist/'
          src:    ['**/*.*']
          dest:   '../public'
        }]

    ###
    # Monitor the file system and react to changes
    # The temp and dist tasks sets up slipstreaming
    # of changed files to play.
    ###
    regarde:
      scripts:
        files: './app/scripts/**/*.js'
        tasks: ['copy:scripts']
      coffee:
        files: './app/scripts/**/*.coffee'
        tasks: ['coffeelint', 'coffee:app']
      less:
        files: './app/styles/**/*.less'
        tasks: ['less:dev']
      imagemin:
        files: [
          expand: true
          cwd:    './app/images'
          src:    ['**/*.png', '**/_*.jpg']
          dest:   './dist/images'
        ]
        tasks: ['imagemin:dev']
      test:
        files: './test/**/*.coffee',
        tasks: ['test']
      template:
        files: [
          expand: true
          cwd:    './app/templates'
          src:    ['**/*.template']
          dest:   './temp/templates'
          ext:    '.html'
        ]
        tasks: ['template:dev']
      temp:
        files: './temp/**/*.*'
        tasks: ['livereload']
      dist:
        files: './dist/**/*.*'

    template:
      dev:
        files: [
          expand: true
          cwd:    './app/templates'
          src:    ['**/*.template']
          dest:   './temp/templates'
          ext:    '.html'
        ]
        options:
          data:
            env: 'dev'


    ###
    # BIG ASS WARNING: Make sure to use the AngularJS injection annotations,
    # otherwise your code might not work once minified. If you don't want
    # to use the injection annotations, turn off uglification.
    ###
    requirejs:
      compile:
        options:
          name:                     'app'
          baseUrl:                  './temp/scripts'
          mainConfigFile:           './temp/scripts/main.js'
          optimize:                 'uglify2'
          generateSourceMaps:       true
          out:                      './dist/scripts/scripts.min.js'
          preserveLicenseComments:  false

  grunt.loadNpmTasks 'grunt-regarde'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-testacular'
  grunt.loadNpmTasks 'grunt-template-helper'

  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-mincss'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'

  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-livereload'

  grunt.registerTask 'testacular', 'start the testacular runner', () ->
    done = grunt.task.current.async()
    require('child_process').exec 'testacular start --single-run', (err, stdout) ->
      grunt.log.write stdout
      done err

  grunt.registerTask 'default', [
    'coffeelint:app'
    'coffee:app'
    'less'
    'template:dev'
  ]

  grunt.registerTask 'dev', [
    'livereload-start'
    'connect'
    'default'
    'imagemin:dev'
    'copy:playAll'
    'regarde'
  ]

  grunt.registerTask 'test', [
    'coffeelint'
    'clean:dev'
    'coffee'
    'copy:scripts'
    'copy:test'
    'testacular'
  ]

  grunt.registerTask 'build', [
    'coffeelint:app'
    'clean'
    'coffee:app'
    'less'
    'mincss'
    'template'
    'imagemin:prod'
    'copy:scripts'
    'requirejs'
  ]

  grunt.registerTask 'play', [
    'build'
    'default'
    'copy:playAll'
  ]

  grunt.event.on 'regarde:file', (status, section, filepath) ->
    return if not ngSeedConfig.slipstream
    return if section isnt 'dist' and section isnt 'temp'
    return if status is 'deleted'

    dest = filepath.replace section,'../public'
    slipcopy filepath, dest

  slipcopy = (src, dest) ->
    try
      grunt.log.writeln "Copying #{src.cyan} -> #{dest.cyan}"
      grunt.file.copy src, dest
    catch e
      grunt.log.error "Failed to copy file #{src.cyan} to play's public directory."
      grunt.log.error e