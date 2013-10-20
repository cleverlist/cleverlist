'use strict';


angular.module('cleverlistApp').controller 'CheckoutCtrl', ['$scope', 'checkout', ($scope, checkout) ->

  $scope.discounts = checkout.discounts();
  #$scope.discounts = [
  #      {name: "Jus Tropicana", discount_price: "5", original_price: "7" },
  #      {name: "Steach hache de ouf", discount_price: "5", original_price: "7" },
  #      {name: "Coton tiges en or", discount_price: "5", original_price: "7" },
  #      ]

  for d in $scope.discounts
    d.discount = parseInt(d.discount_price) - parseInt(d.original_price);

  $scope.sum = 0;
  $scope.sum += parseInt(p.original_price) - parseInt(p.discount_price) for p in $scope.discounts

  ]
