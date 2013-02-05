module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

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
        dest:   './test'
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
      line_endings :
        value: "unix"
        level: "warn"
      max_line_length :
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
      prod:
        options:
          yuicompress: true
        files: [
          expand: true
          cwd:    './app/styles'
          src:    ['**/*.less', '!**/_*.less']
          dest:   './dist/styles'
          ext:    '.css'
        ]

    clean:
      dev:
        folder: './temp/*'
      prod:
        folder: './dist/*'
      play:
        folder: '../public/*'

    copy:
      scripts:
        files: [
          expand: true
          cwd:    './app/scripts'
          src:    ['**/*.js']
          dest:   './temp/scripts'
        ]
      play:
        files: [
          {
            expand: true
            cwd:    './temp/scripts'
            src:    ['**/*.js']
            dest:   '../public/scripts'
          }
          {
            expand: true
            cwd:    './temp/styles'
            src:    ['**/*.css']
            dest:   '../public/styles'
          }
          {
            expand: true
            cwd:    './temp/images'
            src:    ['**/*.*']
            dest:   '../public/images'
          }
        ]

    watch:
      coffee:
        files: './app/scripts/**/*.coffee'
        tasks: ['coffeelint', 'coffee:app']
      less:
        files: './app/styles/**/*.less'
        tasks: ['less:dev']
      test:
        files: './test/**/*.coffee',
        tasks: ['coffee', 'coffeelint'] #NOTE: add testacular task

    ###
    # BIG ASS WARNING: Make sure to use the AngularJS injection annotations,
    # otherwise your code might not work once minified.
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

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'

  grunt.registerTask 'default', ['coffeelint:app', 'clean:dev', 'coffee:app', 'less:dev']
  grunt.registerTask 'build', ['coffeelint:app', 'clean:dev', 'clean:prod', 'coffee:app', 'less:prod', 'copy:scripts', 'requirejs']
  grunt.registerTask 'test', ['coffee', 'coffeelint']
  grunt.registerTask 'play', ['coffeelint:app', 'clean', 'coffee:app', 'less:dev', 'copy:play']
  grunt.registerTask 'dev', ['coffee', 'coffeelint', 'less:dev', 'watch']