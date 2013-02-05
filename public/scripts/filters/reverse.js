
/* global define
*/


(function() {

  define(['filters/filters'], function(filters) {
    'use strict';
    return filters.filter('reverse', [
      function() {
        return function(text) {
          return text.split('').reverse().join('');
        };
      }
    ]);
  });

}).call(this);
