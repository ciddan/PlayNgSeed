### global define ###
define ['filters/filters'], (filters) ->
  'use strict'
  filters.filter 'reverse', [ () -> (text) ->
    text.split('').reverse().join ''
  ]