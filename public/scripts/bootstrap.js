
/* global define
*/


(function() {

  define(['domReady!', 'angular'], function(document, ng) {
    return ng.bootstrap(document, ['dmBuilder']);
  });

}).call(this);
