define ['chai'], (chai) ->
  'use strict'

  assert = chai.assert

  describe 'Filter: Reverse', () ->
    beforeEach module 'dmBuilder'

    it 'should reverse any given string', inject ['reverseFilter', (reverse) ->
      testString = 'leakiM'
      reversedString = reverse testString

      assert.notEqual reversedString, testString
      assert.strictEqual reversedString, 'Mikael'
    ]