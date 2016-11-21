app.controller('appControllerOrders',['$rootScope','$scope','$animate','$resource' ,'DeliveryCompany', 'PreciosDelivery', function($rootScope,$scope,$animate,$resource,  DeliveryCompany, PreciosDelivery) {

  $scope.delivery_companies = [];
  $scope.valordespacho = 0;
  $scope.total = 0;
  $scope.company={selectedCompany:''};

  DeliveryCompany.query({}, function(result) {
    $scope.delivery_companies = result.resultado;
    console.log(result);
  });

  $scope.total = $scope.valordespacho + gon.totalorden




  $scope.actualizaPrecio=function(){
    PreciosDelivery.get({
      id: $scope.company.selectedCompany,
      idcliente: gon.idcliente
    }, function(result) {
      console.log(result);
      console.log(result.valor);
      $scope.valordespacho=result.valor;
      gon.valordespacho = result.valor;

      $scope.total = $scope.total + result.valor;
      gon.total = $scope.total;
    })
  }
}]);
