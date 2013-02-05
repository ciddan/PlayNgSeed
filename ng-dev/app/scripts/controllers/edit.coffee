### global define ###
define ['controllers/controllers'], (controllers) ->
  'use strict'

  controllers.controller 'EditCtrl', ($scope) ->
    $scope.project =
      edit: false
      name: 'foo'