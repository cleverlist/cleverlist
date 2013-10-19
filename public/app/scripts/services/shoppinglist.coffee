'use strict'

angular.module('cleverlistApp')
  .service 'shoppinglist', ['$q', ($q) ->
    class List
      constructor: (e) ->
        angular.extend(this, e)
        if not @products then @products = [ {name: 'chocolat', checked: false}, {name:'lait', checked: true}]
      position_of: (i) ->
        for p, idx in @products
          if i == p.name then return idx
        return -1

      add: (i) ->
        if @position_of(i) == -1 then @products.push(name: i);

      remove: (i) ->
        p = @position_of(i);
        if p != -1 then @products.splice(p, 1);

      save: ->

    service =
      create: -> return $q.when(_id: 42);
      find: (id) ->
        if id
          # Api call
          $q.when(new List(_id: 42));
        else null

    return service;
  ]
