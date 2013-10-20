angular.module('cleverlistApp')
  .service 'checkout', ['$q', '$http', ($q, $http) ->

    discounts = []

    service =
      add_discout: (d) -> discounts.push(d);
      remove_discout: (d) ->

      discouts: -> discouts
    return service
  ]
