'use strict';

angular.module('cleverlistApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'hmTouchEvents'
])
  .config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/welcome.html',
        controller: 'WelcomeCtrl'
      })
      .when('/list_edit', {
        templateUrl: 'views/list_edit.html',
        controller: 'ListEditCtrl'
      })
      .when('/ads_panel', {
        templateUrl: 'views/ads_panel.html',
        controller: 'AdsPanelCtrl'
      })
      .when('/choose_shop', {
        templateUrl: 'views/choose_shop.html',
        controller: 'ChooseShopCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
    $locationProvider.html5Mode(true).hashPrefix('!');


    Hammer.gestures.Swipe.defaults.swipe_velocity = 0.1;

  }]);
