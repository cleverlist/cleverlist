'use strict';

products_categories = ['lait', 'chocolat','test']

angular.module('cleverlistApp').controller 'ListEditCtrl', ['$scope', '$q', 'shoppinglist', 'ads', 'checkout', ($scope, $q, shoppinglist, ads, checkout) ->

  # TODO: revoir l'appel !!!
  get_has_ads = (p) -> ads.category_has_ad(p).then (b) -> p.has_ads = (b.data.length > 0);

  $q.when(shoppinglist.find(100)).then (l) ->
    if l then $scope.list = l;
    else
      #Create a new list.
      shoppinglist.create().then (l) -> $scope.list = l; localStorage.setItem("list_id", l._id);
  .then ->
    console.log("YAY");
    for p in $scope.list.products
      get_has_ads(p);

  $scope.toggle_check = (cat) ->
    if cat.checked then $scope.list.uncheck(cat.name);
    else $scope.list.check(cat.name);

  $scope.add_product = () ->
    $scope.to_add = $("#add_product").val();
    if $scope.to_add then shoppinglist.add($scope.to_add).then (l) -> $scope.list = l
    $scope.to_add='';
    $("#add_product").val('');
    for p in $scope.list.products
      console.log(p)
      get_has_ads(p);

  $scope.remove_product = (i) -> $scope.list.remove(i);

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

  $scope.focus_ads = null;
  $scope.ads_for = {};
  $scope.toggle_ads_for = (cat) ->
    if $scope.focus_ads == cat then return $scope.focus_ads = null;
    $scope.focus_ads = cat;
    ads.get(cat).then (ret) -> $scope.ads_for[cat] = ret.data;


  $("#add_product").typeahead name: 'prod', local: product_categories, limit: 10
  $("#add_product").on 'typeahead:selected', (s, u) ->
    $scope.to_add = u.value;
    $scope.add_product();
    $scope.$apply();

  $("#add_product").on 'typeahead:autocompleted', (s, u) ->
    $scope.to_add = u.value;
    $scope.add_product();
    $scope.$apply();

  $scope.is_checked = (ch) -> (p) -> return (ch && p.checked) || (!ch && !p.checked)

  $scope.add_discount = (d) -> checkout.add(d);



  ]
