app.controller('appControllerStock',['$rootScope','$scope','$animate','$resource' ,'StocksTiendas','StocksTiendas2','StocksArticulos', 'Bodegas', function($rootScope,$scope,$animate,$resource,  StocksTiendas,StocksTiendas2, StocksArticulos, Bodegas) {


  $scope.test = "FUNCIONA";

  $scope.bodegaCargada = true;
  $scope.productoCargado = true;
  $scope.colorCargado = true;
  $scope.sexoCargado = true;
  $scope.tallaCargada = true;
  $scope.ingresoDeshabilitado = true;

  $scope.cantidad=0;
  $scope.articulos = [];
  $scope.bodegas=[];
  $scope.productos = [];
  $scope.sexos = [];
  $scope.tallas =[];
  $scope.colores =[];
  $scope.productos = {productoescogido:''};
  $scope.sexo = {sexoescogido:''};
  $scope.tallas = {tallaescogida:''};
  $scope.colores = {colorescogido:''};
  $scope.bodega = {bodegaescogida:''};


  $scope.cargaBodegas=function() {
    Bodegas.query(
    {
      tienda_id: gon.tienda_id
    }, function(result){

      $scope.bodegas = result.resultado;
    })
  }


  $scope.cargaProductos = function(){
    console.log("Cargando productos");
    $scope.bodegaCargada=false;
    $scope.productoCargado = true;
    $scope.sexoCargado = true;
    $scope.tallaCargada = true;
    $scope.colorCargado = true;
    $scope.ingresoDeshabilitado = true;

    StocksArticulos.query({
      tienda_id: gon.tienda_id,
      bodega_id: $scope.bodega.bodegaescogida
    }, function(result) {
      $scope.productos = result.resultado.resultado;

    })
  };


  $scope.cargaSexos = function(){
    console.log("Cargando Sexos");
    $scope.bodegaCargada=false;
    $scope.productoCargado = false;
    $scope.sexoCargado = true;
    $scope.tallaCargada = true;
    $scope.colorCargado = true;
    $scope.ingresoDeshabilitado = true;
    StocksArticulos.query({
      tienda_id: gon.tienda_id,
      producto_id: $scope.productos.productoescogido,
      bodega_id: $scope.bodega.bodegaescogida
    }, function(result) {
      $scope.sexos = result.resultado.resultado;
    })
  };


  $scope.cargaTallas = function(){
    console.log("Cargando Tallas");
    $scope.bodegaCargada=false;
    $scope.productoCargado = false;
    $scope.sexoCargado = false;
    $scope.tallaCargada = true;
    $scope.colorCargado = true;
    $scope.ingresoDeshabilitado = true;
    StocksArticulos.query(
      {
          tienda_id: gon.tienda_id,
          producto_id: $scope.productos.productoescogido,
          sexo: $scope.sexo.sexoescogido,
          bodega_id: $scope.bodega.bodegaescogida
        }, function(result) {
      $scope.tallas = result.resultado.resultado;
    })
  };


  $scope.cargaColores = function(){
    console.log("Cargando Colores");
    $scope.bodegaCargada=false;
    $scope.productoCargado = false;
    $scope.sexoCargado = false;
    $scope.tallaCargada = false;
    $scope.colorCargado = true;
    $scope.ingresoDeshabilitado = true;
    StocksArticulos.query(
    {
          tienda_id: gon.tienda_id,
          producto_id: $scope.productos.productoescogido,
          sexo: $scope.sexo.sexoescogido,
          talla: $scope.tallas.tallaescogida,
          bodega_id: $scope.bodega.bodegaescogida
        }, function(result) {
      $scope.colores = result.resultado.resultado;
    })
  };


  $scope.ingresaStock = function() {
    console.log("Ingresa stock");
    console.log($scope.productos.productoescogido);
    StocksArticulos.create(
      {
        bodega_id: $scope.bodega.bodegaescogida,
        producto_id: $scope.productos.productoescogido,
        sexo: $scope.sexo.sexoescogido,
        talla: $scope.tallas.tallaescogida,
        color: $scope.colores.colorescogido,
        cantidad: $scope.cantidad

      }, function(result) {
        $scope.cargaInicial();
        $scope.limpiar();
      }

    )
  };

  $scope.cargaArticulos=function() {
    StocksTiendas.query(
        {tienda_id: gon.tienda_id,
        bodega_id: $scope.bodega.bodegaescogida},
        function(result) {
          console.log("Articulos "+result.articulos);
          $scope.articulos = result.articulos;

        }
      );

    };


    $scope.cargaInicial=function() {

      $scope.cargaArticulos();
      $scope.cargaBodegas();
    }

    $scope.habilitaStock=function() {
      $scope.bodegaCargada=false;
      $scope.productoCargado = false;
      $scope.sexoCargado = false;
      $scope.tallaCargada = false;
      $scope.colorCargado = false;

      $scope.ingresoDeshabilitado = true;
   }

    $scope.habilitaIngreso=function() {
      $scope.bodegaCargada=false;
      $scope.productoCargado = false;
      $scope.sexoCargado = false;
      $scope.tallaCargada = false;
      $scope.colorCargado = false;
      $scope.ingresoDeshabilitado = false;

   }



    $scope.limpiar=function() {
      $scope.productos.productoescogido = "";
      $scope.bodega.bodegaescogida = "";
      $scope.colores.colorescogido = "";
      $scope.tallas.tallaescogida = "";
      $scope.sexo.sexoescogido = "";
      $scope.cantidad = 0;
      $scope.bodegaCargada=true;
      $scope.productoCargado = true;
      $scope.sexoCargado = true;
      $scope.tallaCargada = true;
      $scope.colorCargado = true;
      $scope.ingresoDeshabilitado = true;

    }


    $scope.eliminaStock=function(idStock) {
      StocksTiendas2.delete(
      {
        id: idStock
      },function(result){
        $scope.cargaInicial();
        $scope.limpiar();
      });

    }

  }]);

