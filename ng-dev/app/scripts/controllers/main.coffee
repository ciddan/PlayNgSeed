### global define ###
define ['controllers/controllers'], (controllers) ->
  'use strict'

  controllers.controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Testacular'
    ]