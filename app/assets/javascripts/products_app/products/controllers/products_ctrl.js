(function (){
  var app = angular.module('ProductsApp');

  app.controller('ProductsCtrl', ['$scope', '$http', function ($scope, $http)
  {
    $scope.error = [];
    $scope.products = ['Hello!'];
    $scope.index = function () {
      $.get('/products')
    };
  }])
})()
