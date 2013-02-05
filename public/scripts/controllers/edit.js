
/* global define
*/


(function() {

  define(['controllers/controllers'], function(controllers) {
    'use strict';
    return controllers.controller('EditCtrl', function($scope) {
      return $scope.project = {
        edit: false,
        name: 'foo'
      };
    });
  });

}).call(this);
