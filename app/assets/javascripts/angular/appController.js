
app.controller('appController',
        ['$rootScope','$scope','$resource','Sexos', 'Colores', 'Tallas', 'Tiendas','Articulos',
        function($rootScope,$scope,$resource, Sexos, Colores, Tallas, Tiendas, Articulos) {


    var categoryActive=0;
    $scope.colores={};
    $scope.test ="10001";
    $scope.currentIndexImage=-1;
    $scope.imagen ="";
    $scope.firsttime = true;

    $scope.habilitadoSexo=false;
    $scope.habilitadoColor=false;
    $scope.habilitadoTalla=false;
    $scope.habilitadoCantidad=false;
    $scope.habilitadoAgrega=false;

    $scope.muestra = false;

    $scope.toggleDiv = function() {
        $scope.muestra = !$scope.muestra;
    }

    Tiendas.get({id: gon.id_producto}, function(result) {
        $scope.tiendas = result;
    })

    $scope.pueblaSexos = function() {
        console.log("Cambiando combos ");
        $scope.habilitadoSexo=true;
       Sexos.get({id:gon.id_producto, proveedor: $scope.proveedorescogido}, function(result) {
        $scope.sexos=result;
    });
    }




    $scope.pueblaComboColores = function() {
        $scope.habilitadoColor=true;
        console.log("Poblando los colores para el sexo ", $scope.sexoescogido);
        Colores.get({id: gon.id_producto, sexo: $scope.sexoescogido, proveedor: $scope.proveedorescogido}, function(result) {

            $scope.colores = result;


        } )

    }


    $scope.pueblaComboTallas = function() {
        $scope.habilitadoTalla=true;
        console.log("Poblando los colores para el sexo ", $scope.sexoescogido, " y el color ", $scope.colorescogido);
        Tallas.get({id: gon.id_producto, sexo: $scope.sexoescogido, color: $scope.colorescogido, proveedor: $scope.proveedorescogido}, function(result) {

            $scope.tallas = result;
        })
    }

    $scope.activaCantidad = function() {
        $scope.habilitadoCantidad=true;
    }

    $scope.buscaPrecio = function() {
        $scope.habilitadoAgrega=true;
        console.log("Buscando el precio del articulo ");
        var valor = 0;
        Articulos.get({id: gon.id_producto, sexo: $scope.sexoescogido, color: $scope.colorescogido, proveedor: $scope.proveedorescogido, talla: $scope.tallaescogida}, function(result) {
            console.log(result);
            $scope.valorarticulo=$scope.cantidadescogida*result.price;
        })

    }



    $scope.isSelected = function(idImagen, index) {
        if (idImagen == $scope.currentIndexImage) {
            return true;
        }
        if ($scope.currentIndexImage == -1 && index == 1)
        {
            return true;
        }
        return false;
    }
    $scope.cambiaImagen = function(idImagen) {
        console.log(idImagen);
        console.log(gon.imagenesproducto[idImagen]);
        $scope.imagen = gon.imagenesproducto[idImagen];
        $scope.currentIndexImage = idImagen;
        $scope.firsttime = false;

    }

    $scope.changeCategory = function(idCategory) {

      console.log("Categoria previa es "+categoryActive);
        localStorage.setItem("categoryActive", idCategory)
      console.log("Categoria final es "+categoryActive);
    }
    $scope.showCategory = function() {
      return  localStorage.getItem("categoryActive");
    }

 }]);
