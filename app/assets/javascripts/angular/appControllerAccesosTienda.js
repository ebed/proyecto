app.controller('accesosTiendaController',
        ['$rootScope','$scope','$animate','$resource','Permisos','Permisos2', 'Users',
        function($rootScope,$scope,$animate,$resource, Permisos, Permisos2, Users) {

          $scope.selectedValue;
          $scope.usuariosSelect = Users.query({tienda_id: gon.tienda_id}, function(result) {
              console.log(result);
            });

          $scope.usuarios = Permisos.query({tienda_id: gon.tienda_id}, function(result) {
              console.log(result);
            });

          $scope.agregaUsuario = function() {
             console.log($scope.selectedValue);
             Permisos.put({tienda_id: gon.tienda_id, user_id: $scope.selectedValue.id});
             $scope.usuarios.push($scope.selectedValue);

             var index = $scope.usuariosSelect.indexOf($scope.selectedValue);
             $scope.usuariosSelect.splice(index, 1);
          };

          $scope.elimina = function(user) {
            console.log("ELimina usuario", user.id);
            Permisos2.delete({tienda_id: gon.tienda_id, user_id: user.id});
            $scope.usuariosSelect.push(user)
            var index = $scope.usuarios.indexOf(user);
             $scope.usuarios.splice(index, 1);
          };





}]);
