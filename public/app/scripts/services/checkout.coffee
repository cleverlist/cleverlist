angular.module('cleverlistApp')
  .service 'checkout', ['$q', '$http', ($q, $http) ->

    discounts = []

    service =
      toggle: (dd) ->
        for d, idx in discounts
          if d.brand == dd.brand then return discounts.splice(idx,1)
        discounts.push(dd);

      add_discout: (d) -> discounts.push(d);
      remove_discout: (d) ->

      discouts: -> discouts
    return service
  ]
