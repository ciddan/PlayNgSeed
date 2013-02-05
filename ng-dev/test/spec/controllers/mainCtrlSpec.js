(function() {

  define(['chai'], function(chai) {
    'use strict';

    var assert;
    assert = chai.assert;
    return describe('Controller: MainCtrl', function() {
      var MainCtrl, scope;
      beforeEach(module('dmBuilder'));
      MainCtrl = {};
      scope = {};
      beforeEach(inject(function($controller) {
        scope = {};
        return MainCtrl = $controller('MainCtrl', {
          $scope: scope
        });
      }));
      return it('should attach a list of awesomeThings to the scope', function() {
        return assert.lengthOf(scope.awesomeThings, 3, 'awesomeThings has 3 things');
      });
    });
  });

}).call(this);
