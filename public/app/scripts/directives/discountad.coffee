'use strict';


angular.module('cleverlistApp').directive 'discountad', ['checkout', (checkout) ->

  return (scope, elem, attrs) ->
        elem.on 'click', ->
          elem.toggleClass('active')
          checkout.toggle(scope.$eval(attrs.discount))
  ]
