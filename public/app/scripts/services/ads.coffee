'use strict'

angular.module('cleverlistApp')
  .service 'ads', ['$q', '$http', ($q, $http) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    service =
        get: (cat) -> return $http.get('/api/discounts/' + cat);
        category_has_ad: (cat) -> console.log(cat); return $http.get('/api/discounts/' + cat);


    return service;
  ]
