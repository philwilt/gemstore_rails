(function (){
  var app = angular.module('ProductsApp');

  app.controller('ProductsCtrl', ['$scope', '$http', function($scope, $http)
  {
    $scope.errors = [];
    $scope.products = [];
    $scope.categories = [];

    $scope.index = function () {
      $scope.indexCategories();

      $http.get('/apiv1/products')
        .success(function(data){
          $scope.products = data;
        })
        .error(function(data,status){
          $scope.errors.push(data);
        });
    };

    $scope.indexCategories = function() {
      $http.get('/apiv1/categories')
        .success(function(data) {
          $scope.categories = data;
          console.log($scope.categories);
        })
        .error(function(data, status) {
          console.log(status);
          console.log(data);
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

    $scope.update = function(product) {
      $http({
        url: '/apiv1/products/' + product.id,
        method: 'PATCH',
        data: { product: product }
      })
        .success(function(data){
          product.editing = false;
        })
        .error(function(data,status){
          $scope.errors.push(data);
        });
    };

    $scope.destroy = function (product) {
      $http({
        method: 'DELETE',
        url: '/apiv1/products/' + product.id
      })
        .success(function(){
          product.deleteConfirm = false;
          $scope.products.splice($scope.products.indexOf(product), 1);
        })
        .error(function(data,status){
            $scope.errors.push(data);
        });
    };
  }])
})()
