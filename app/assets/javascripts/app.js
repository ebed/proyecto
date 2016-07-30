app = angular.module('app',[
])



app.controller('appController', ['$rootScope','$scope', function($rootScope,$scope) {
    var categoryActive=0;




    $scope.changeCategory = function(idCategory) {

      console.log("Categoria previa es "+categoryActive);
        localStorage.setItem("categoryActive", idCategory)
      console.log("Categoria final es "+categoryActive);
    }
    $scope.showCategory = function() {
      return  localStorage.getItem("categoryActive");
    }
  }
]);
