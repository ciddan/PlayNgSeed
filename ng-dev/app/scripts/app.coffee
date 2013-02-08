
### global define ###
define [
  'angular'
  'controllers/controllers'
  'directives/directives'
  'services/services'
  'filters/filters'
], (ng) ->
  'use strict'
  ng.module('ngPlaySeed', ['controllers', 'directives', 'services', 'filters'])