'use strict'

describe 'Service: Shoppinglist', () ->

  # load the service's module
  beforeEach module 'CleverlistApp'

  # instantiate service
  Shoppinglist = {}
  beforeEach inject (_Shoppinglist_) ->
    Shoppinglist = _Shoppinglist_

  it 'should do something', () ->
    expect(!!Shoppinglist).toBe true
