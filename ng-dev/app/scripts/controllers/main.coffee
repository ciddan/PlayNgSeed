### global define ###
define ['controllers/controllers'], (module) ->
  'use strict'

  module.controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Testacular'
    ]