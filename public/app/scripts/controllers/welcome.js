'use strict';

angular.module('cleverlistApp')
    .controller('WelcomeCtrl', ['$scope', '$location', '$timeout' , function ($scope, $location, $timeout) {
      $timeout(function() { $location.url('/list_edit');},2000);
      $scope.begin = function () {  $location.url('/list_edit'); };
  }]);
