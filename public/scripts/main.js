
/* global require
*/


(function() {

  require.config({
    paths: {
      'angular': 'vendor/angular',
      'domReady': 'vendor/domReady'
    },
    shim: {
      'angular': {
        exports: 'angular'
      }
    }
  });

  require(['require', 'app', 'routes', 'controllers/main', 'controllers/project', 'controllers/edit', 'filters/reverse'], function(require) {
    return require(['bootstrap']);
  });

}).call(this);
