app.controller('appControllerScores',['$rootScope','$scope','$animate','$resource' ,'Scores', function($rootScope,$scope,$animate,$resource,  Scores) {

  var scoreproduct=[];
  var scoretienda=[];

  $scope.test="TEST";
  $scope.comentariosTienda;

  $scope.loadscores=function(idProducto, idUsuario){
    Scores.get({opcion: "producto", idproducto: idProducto, idusuario: idUsuario}, function(result){
      scoreproduct[idProducto] = result.value;

    });

  }
  $scope.getComentariosTienda = function() {
    Scores.get({opcion: "tienda"},function(result) {
      $scope.comentariosTienda=result;
    })
  }

  $scope.submitEvaluationProduct = function(idProducto, idUsuario, comentario) {
    console.log("los valores recuperados son: "+idProducto+ " "+idUsuario+" " + comentario);
    Scores.put({opcion: "commentProduct", producto: idProducto, usuario: idUsuario, comentario: comentario }, function(result) {

    })
  }



  $scope.rateProduct = function(score,idProducto, iduser) {
    Scores.put({opcion: "scoreproducto", producto: idProducto, scoreproducto: score, user: iduser}, function(result) {
      console.log(result);
    })
  }
}]);
