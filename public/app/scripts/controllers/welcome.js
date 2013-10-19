'use strict';

angular.module('cleverlistApp')
  .controller('WelcomeCtrl', ['$scope', '$location', function ($scope, $location) {
    $scope.begin = function () { $location.url('/list_edit'); }
  }]);
