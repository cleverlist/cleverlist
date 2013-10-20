'use strict'

angular.module('cleverlistApp')
  .service 'shoppinglist', ['$q', '$http', ($q, $http) ->
    class List
      constructor: (e) ->
        angular.extend(this, e)
        if not @products then @products = []

      position_of: (i) ->
        for p, idx in @products
          if i == p.name then return idx
        return -1

      add: (i) ->
        if @position_of(i) == -1 then @products.unshift(name: i);@save();

      check: (i) ->
        pos = @position_of(i)
        if pos == -1 then return;
        p = @products[pos]
        @products.splice(pos, 1);
        p.checked = true;

        new_pos = @products.length;
        for o, idx in @products
          if o.checked then new_pos = idx; break;
        @products.splice(new_pos, 0, p);

        @save()

      uncheck: (i) ->
        pos = @position_of(i)
        if pos == -1 then return;
        p = @products[pos]
        @products.splice(pos, 1);
        p.checked = false;
        @products.unshift(p);
        @save()

      remove: (i) ->
        p = @position_of(i);
        if p != -1 then @products.splice(p, 1);
        @save()

      save: -> console.log(this);$http.post('/api/productlists/save/' + this.user_id, @toJson())

      toJson: -> angular.toJson(this)

    service =
      add: (cat) -> return $http.get('/api/productlists/' + 100 + '/insert/' + cat.name);
      create: -> return $q.when(new List());
      find: (id) ->
        if id
          # Api call
          $http.get('/api/productlists/' + id).then (r) -> new List(r.data);
        else null

    return service;
  ]
