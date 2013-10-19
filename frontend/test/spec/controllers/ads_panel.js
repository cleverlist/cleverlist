'use strict';

describe('Controller: AdsPanelCtrl', function () {

  // load the controller's module
  beforeEach(module('cleverlistApp'));

  var AdsPanelCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AdsPanelCtrl = $controller('AdsPanelCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
