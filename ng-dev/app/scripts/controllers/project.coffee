### global define ###
define ['controllers/controllers'], (controllers) ->
  'use strict'

  controllers.controller 'ProjectCtrl', ($scope) ->
    $scope.project =
      edit: false
      name: 'foo'