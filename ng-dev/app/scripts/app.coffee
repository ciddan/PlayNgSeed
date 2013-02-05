### global define ###
define [
  'angular'
  'controllers/controllers'
  'directives/directives'
  'services/services'
  'filters/filters'
], (ng) ->
  'use strict'
  ng.module('dmBuilder', ['controllers', 'directives', 'services', 'filters'])