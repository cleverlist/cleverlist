'use strict'

angular.module('cleverlistApp')
  .service 'ads', ['$q', ($q) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    db =
      lait: [
        { name: "Lactel", text: "Un offer un gratuit"},
        { name: "Carrefour", text: "-20% de reduc immédiate"},
      ]
      chocolat: [
        { name: "Milka", text: "Un snickers offert!"},
        { name: "Neslé", text: "-20% de reduc immédiate"},
      ]
    service =
        get: (cat) -> return $q.when(db[cat]);
        category_has_ad: (cat) -> return $q.when(db[cat].length > 0);

    return service;
  ]
