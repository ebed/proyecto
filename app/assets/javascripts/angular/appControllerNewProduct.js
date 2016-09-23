
app.controller('appControllerNewProduct',
        ['$rootScope','$scope','$animate','$resource','Sexos', 'Colores', 'Tallas', 'Tiendas','Articulos','Categorias','Subcategorias',
        function($rootScope,$scope,$animate,$resource, Sexos, Colores, Tallas, Tiendas, Articulos, Categorias, Subcategorias) {


          $scope.habilitadoSubcategoria=false;

          Categorias.get(function(result) {
            $scope.categorias = result;
          });

          $scope.activaSubcategoria = function() {
            Subcategorias.get({categoria: $scope.categoriaseleccionada}, function(result) {
              $scope.subcategorias=result;
              $scope.habilitadoSubcategoria = true;
            });
          }


}]);
