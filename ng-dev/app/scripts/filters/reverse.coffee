### global define ###
define ['filters/filters'], (module) ->
  'use strict'
  module.filter 'reverse', [ () -> (text) ->
    text.split('').reverse().join ''
  ]