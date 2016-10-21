app.controller('categoryController',
        ['$scope','$animate','$resource',
        function($scope,$animate,$resource) {


          $scope.selectedoption;

          $scope.estaSeleccionado=function(validado) {
            if (gon.paginaActual == validado)  {
              return true;
            }
            return false;
          }
}]);
