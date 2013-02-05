### global define ###
define ['app'], (app) ->
  'use strict'

  app.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'assets/views/main.html'
      controller: 'MainCtrl'
    .when '/project'
      templateUrl: 'assets/views/project.html'
      controller: 'ProjectCtrl'
    .when '/project/:name'
      templateUrl: 'assets/views/edit.html'
      controller: 'EditCtrl'
    .otherwise
      redirectTo: '/'
  ]