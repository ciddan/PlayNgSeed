define ['chai'], (chai) ->
  'use strict'

  assert = chai.assert

  describe 'Controller: MainCtrl', () ->
    beforeEach module 'dmBuilder'

    MainCtrl = {}
    scope = {}

    # Initialize the controller and a mock scope
    beforeEach inject ($controller) ->
      scope = {}
      MainCtrl = $controller 'MainCtrl', {$scope: scope}

    it 'should attach a list of awesomeThings to the scope', () ->
      assert.lengthOf scope.awesomeThings, 3, 'awesomeThings has 3 things'
