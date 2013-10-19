'use strict';


angular.module('cleverlistApp').controller 'ListEditCtrl', ['$scope', '$q', 'shoppinglist', 'ads', ($scope, $q, shoppinglist, ads) ->

  get_has_ads = (p) -> ads.category_has_ad(p.name).then (b) -> p.has_ads = b; console.log(p);

  $q.when(shoppinglist.find(localStorage.getItem("list_id"))).then (l) ->
    if l then $scope.list = l
    else
      #Create a new list.
      shoppinglist.create().then (l) -> $scope.list = l; localStorage.setItem("list_id", l._id);
  .then ->
    for p, i in $scope.list.products || []
      get_has_ads(p);

  $scope.add_product = () ->
    if $scope.to_add then $scope.list.add($scope.to_add);
    $scope.to_add=null;

  $scope.remove_product = (i) -> if i then $scope.list.remove(i);

  $scope.ads_category = null;


  panel = angular.element(document.getElementById('ads_panel'));

  $scope.swipeleft_ads_panel = () ->
    panel.addClass('on');
    panel.removeClass('off');
    console.log('swipeleft');

  $scope.swiperight_ads_panel = () ->
    panel.addClass('off');
    panel.removeClass('on');
    console.log('swiperight');

  $scope.show_ads_for = (cat) ->
    $scope.swipeleft_ads_panel();
    $scope.ads_category = cat;
    ads.get(cat).then (ret) -> $scope.ads = ret;
  ]
