require.config
  baseUrl: '/base/scripts'
  paths:
    'angular'             : 'vendor/angular'
    'angular-mocks'       : '../test/vendor/angular-mocks'
    'chai'                : '../test/vendor/chai'
  shim:
    'angular'             : exports: 'angular'
    'angular-mocks'       : exports: 'angular-mocks', deps : ['angular']


require [
  'angular-mocks'
  'app'
  'controllers/main'
  'filters/reverse'
  '../test/spec/controllers/mainCtrlSpec'
  '../test/spec/filters/reverseSpec'
], () ->
  window.__testacular__.start()