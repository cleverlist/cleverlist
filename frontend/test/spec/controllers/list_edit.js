'use strict';

describe('Controller: ListEditCtrl', function () {

  // load the controller's module
  beforeEach(module('cleverlistApp'));

  var ListEditCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ListEditCtrl = $controller('ListEditCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
