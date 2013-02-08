### global define ###
define ['app'], (app) ->
  'use strict'

  app.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'assets/templates/views/main.html'
      controller: 'MainCtrl'
    .otherwise
      redirectTo: '/4'
  ]