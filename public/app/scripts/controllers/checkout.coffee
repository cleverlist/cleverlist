'use strict';


angular.module('cleverlistApp').controller 'CheckoutCtrl', ['$scope', 'checkout', ($scope, checkout) ->

  #$scope.discount = checkout.discount();
  $scope.discounts = [
        {name: "Jus Tropicana", price: "-5"},
        {name: "Steach hache de ouf", price: "-15"},
        {name: "Coton tiges en or", price: "-500"},
        ]

  $scope.sum = 0;
  $scope.sum += parseInt(p.discount_price) - parseInt(p.original_price) for p in $scope.discounts

  ]
