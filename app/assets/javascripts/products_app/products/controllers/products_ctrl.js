(function (){
  var app = angular.module('ProductsApp');

  app.controller('ProductsCtrl', ['$scope', '$http', function($scope, $http)
  {
    $scope.errors = [];
    $scope.products = [];

    $scope.index = function () {
      $http.get('/apiv1/products')
        .success(function(data){
          $scope.products = data;
          console.log($scope.products);
        })
        .error(function(data,status){
          $scope.errors.push(data);
        });
    };

    $scope.create = function(product) {
      $http.post('/apiv1/products', { product: product }
      )
        .success(function(data){
          $scope.products.push(data);
        })
        .error(function(data,status){
          $scope.errors.push(data);
        });
    };
  }])
})()
