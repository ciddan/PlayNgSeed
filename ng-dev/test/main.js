(function() {

  require.config({
    baseUrl: '/base',
    paths: {
      'angular': 'app/scripts/vendor/angular',
      'angular-mocks': 'test/vendor/angular-mocks',
      'controllers': 'app/scripts/controllers',
      'filters': 'app/scripts/filters',
      'chai': 'app/components/chai/chai'
    },
    shim: {
      'angular': {
        exports: 'angular'
      },
      'angular-mocks': {
        exports: 'angular-mocks',
        deps: ['angular']
      }
    }
  });

  require(['angular-mocks', 'app/scripts/app', 'controllers/main', 'filters/reverse', 'test/spec/controllers/mainCtrlSpec', 'test/spec/filters/reverseSpec'], function() {
    return window.__testacular__.start();
  });

}).call(this);
