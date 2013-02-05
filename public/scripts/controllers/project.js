
/* global define
*/


(function() {

  define(['controllers/controllers'], function(controllers) {
    'use strict';
    return controllers.controller('ProjectCtrl', function($scope) {
      return $scope.project = {
        edit: false,
        name: 'foo'
      };
    });
  });

}).call(this);
