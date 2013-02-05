(function() {

  define(['chai'], function(chai) {
    'use strict';

    var assert;
    assert = chai.assert;
    return describe('Filter: Reverse', function() {
      beforeEach(module('dmBuilder'));
      return it('should reverse any given string', inject([
        'reverseFilter', function(reverse) {
          var reversedString, testString;
          testString = 'leakiM';
          reversedString = reverse(testString);
          assert.notEqual(reversedString, testString);
          return assert.strictEqual(reversedString, 'Mikael');
        }
      ]));
    });
  });

}).call(this);
