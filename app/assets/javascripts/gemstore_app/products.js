gemStoreApp.directive("productGallery", function (){
  return {
    restrict: 'E',
    templateUrl: "templates/products/product-gallery.html",
    controller: function () {
      this.current = 0;
      this.setCurrent = function(imageNumber){
        this.current = imageNumber || 0;
      };
    },
    controllerAs: 'gallery'
  };
});

gemStoreApp.directive("productDescription", function() {
  return {
    restrict: 'E',
    templateUrl: "templates/products/product-description.html"
  };
});

gemStoreApp.directive("productReviews", function() {
  return {
    restrict: 'E',
    templateUrl: "templates/products/product-reviews.html"
  };
});

gemStoreApp.directive("productSpecs", function () {
  return {
    restrict: 'A',
    templateUrl: "templates/products/product-specs.html"
  };
});

gemStoreApp.directive("productTabs", function() {
  return {
    restrict: 'E',
    templateUrl: "templates/products/product-tabs.html",
    controller: function() {
      this.tab = 1;

      this.isSet = function(checkTab) {
        return this.tab === checkTab;
      };

      this.setTab = function(setTab) {
        this.tab = setTab;
      };
     },
    controllerAs: 'tab'
  };
});
