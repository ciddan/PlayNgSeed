
/* global define
*/


(function() {

  define(['angular', 'controllers/controllers', 'directives/directives', 'services/services', 'filters/filters'], function(ng) {
    'use strict';
    return ng.module('dmBuilder', ['controllers', 'directives', 'services', 'filters']);
  });

}).call(this);
