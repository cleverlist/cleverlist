'use strict';

describe('Controller: ChooseShopCtrl', function () {

  // load the controller's module
  beforeEach(module('cleverlistApp'));

  var ChooseShopCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ChooseShopCtrl = $controller('ChooseShopCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
