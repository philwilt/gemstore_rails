gemStoreApp.controller('StoreController', ['$http', function($http){
  var store = this;
  store.products = [];

  $http.get('templates/products/store-products.json').success(function(data) {
    store.products = data;
  });

}]);

gemStoreApp.controller('ReviewController', function(){
  this.review = {};

  this.addReview = function(product){
    this.review.createdOn = Date.now();
    product.reviews.push(this.review);
    this.review = {};
  };
});
