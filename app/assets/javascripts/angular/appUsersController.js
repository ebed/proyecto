app.controller('userAppController',['$rootScope','$scope','$animate','$resource' ,'Sellers', 'SellersCreate' , function($rootScope,$scope,$animate,$resource, Sellers, SellersCreate ) {


  $scope.habilitados=gon.habilitadosVendedores;



  $scope.cargainicial = function() {
    console.log(gon.habilitadosVendedores.length);

  }

  $scope.estaHabilitado = function(user_id) {
    if ($scope.habilitados[user_id])
      return "SI";
    else
      return "NO";
  }

  $scope.changeStatus = function(user_id) {
    if ($scope.habilitados[user_id]) {
        console.log("SE ELIMINARÁ");
        Sellers.delete({user_id: user_id}, function(result) {
        $scope.habilitados[user_id] = false;
      })

    } else {
        console.log("SE CREARA");
        SellersCreate.put({user_id: user_id }, function(result) {
        console.log("REsultado: ",result);
        $scope.habilitados[user_id]= true;

     })
    }
  }



}]);
