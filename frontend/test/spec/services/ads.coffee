'use strict'

describe 'Service: Ads', () ->

  # load the service's module
  beforeEach module 'CleverlistApp'

  # instantiate service
  Ads = {}
  beforeEach inject (_Ads_) ->
    Ads = _Ads_

  it 'should do something', () ->
    expect(!!Ads).toBe true
