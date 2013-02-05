
/* global define
*/


(function() {

  define(['controllers/controllers'], function(controllers) {
    'use strict';
    return controllers.controller('MainCtrl', function($scope) {
      return $scope.awesomeThings = ['HTML5 Boilerplate', 'AngularJS', 'Testacular'];
    });
  });

}).call(this);
