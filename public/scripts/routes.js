
/* global define
*/


(function() {

  define(['app'], function(app) {
    'use strict';
    return app.config([
      '$routeProvider', function($routeProvider) {
        return $routeProvider.when('/', {
          templateUrl: 'assets/views/main.html',
          controller: 'MainCtrl'
        }).when('/project', {
          templateUrl: 'assets/views/project.html',
          controller: 'ProjectCtrl'
        }).when('/project/:name', {
          templateUrl: 'assets/views/edit.html',
          controller: 'EditCtrl'
        }).otherwise({
          redirectTo: '/'
        });
      }
    ]);
  });

}).call(this);
