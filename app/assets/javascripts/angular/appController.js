
app.controller('appController',
        ['$rootScope','$scope','$resource','Sexos', 'Colores', 'Tallas', 'Tiendas','Articulos', 'Stocks',
        function($rootScope,$scope,$resource, Sexos, Colores, Tallas, Tiendas, Articulos, Stocks) {


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
    $scope.cantidadescogida;
    $scope.muestra = false;

    $scope.tiendaunica = false;
    $scope.firsttienda="";
    $scope.proveedorescogido=0;

    $scope.sexounico=false;
    $scope.sexoescogido="";

    $scope.colorunico = false;
    $scope.colorescogido="";

    $scope.tallaunica=false;
    $scope.tallaescogida="";

    $scope.stock=0;

    $scope.toggleDiv = function() {
        $scope.muestra = !$scope.muestra;
    }

    Tiendas.get({id: gon.id_producto}, function(result) {

        var count = result.length;

        if (count > 1) {
            $scope.tiendaunica=false;
            $scope.tiendas = result;
            $scope.proveedorescogido = gon.tiendaprecargada.id;
            if (gon.tiendaprecargada.id > 0){
                $scope.pueblaSexos();
            }
        } else      {
            $scope.tiendaunica=true;
            $scope.firsttienda=result[0].name;
            $scope.proveedorescogido=result[0].id;
            $scope.pueblaSexos();
        }


    })

    $scope.pueblaSexos = function() {
        console.log("Cambiando combos ");
        $scope.habilitadoSexo=true;
       Sexos.get({id:gon.id_producto, proveedor: $scope.proveedorescogido}, function(result) {

        var count = result.length
        console.log(result.length);

        if (count > 1){
            $scope.sexounico = false;
        }
            else
        {
            $scope.sexounico = true;
            $scope.sexoescogido= result[0][0];
            $scope.pueblaComboColores();
        }
        $scope.sexos=result;
    });
    }




    $scope.pueblaComboColores = function(item) {
        $scope.habilitadoColor=true;
        if (item!=null) {
            $scope.sexoescogido=item;
        }

        console.log("Poblando los colores para el sexo ", $scope.sexoescogido);
        Colores.get({id: gon.id_producto, sexo: $scope.sexoescogido, proveedor: $scope.proveedorescogido}, function(result) {

            $scope.colores = result;
             var count = Object.keys(result).length;
             console.log(count );

            if (count > 1){
                $scope.colorunico = false;

            }
                else
            {
                $scope.colorunico = true;
                $scope.colorescogido= result[0][0];
                $scope.pueblaComboTallas();
            }

        } )

    }


    $scope.pueblaComboTallas = function(item) {
        $scope.habilitadoTalla=true;

        if (item!=null) {
            $scope.colorescogido=item;
        }

        console.log("Poblando los tallas para el sexo ", $scope.sexoescogido, " y el color ", $scope.colorescogido);
        Tallas.get({id: gon.id_producto, sexo: $scope.sexoescogido, color: $scope.colorescogido, proveedor: $scope.proveedorescogido}, function(result) {

            $scope.tallas = result;


            var count = result.length;

            if (count > 1){
                $scope.tallaunica = false;

            }
                else
            {
                $scope.tallaunica = true;
                $scope.tallaescogida= result[0][0];
                $scope.activaCantidad();
            }

        })
    }

    $scope.activaCantidad = function(item) {
        if (item!=null) {
         $scope.tallaescogida=item;
        }


        console.log("Poblando los tallas para el sexo ", $scope.sexoescogido, ", el color ", $scope.colorescogido, ", y la talla ", $scope.tallaescogida, " y producto id : ", gon.id_producto);
        Stocks.get({id: gon.id_producto, sexo: $scope.sexoescogido, color: $scope.colorescogido, talla: $scope.tallaescogida, proveedor: $scope.proveedorescogido}, function(result) {
            $scope.stock = result[0].stock;
            console.log(result[0]);
            console.log(result.stock);

        })
        $scope.habilitadoCantidad=true;
    }

    $scope.buscaPrecio = function() {
        $scope.habilitadoAgrega=true;

        console.log("Buscando el precio del articulo ");
        var valor = 0;
        Articulos.get({id: gon.id_producto, sexo: $scope.sexoescogido, color: $scope.colorescogido, proveedor: $scope.proveedorescogido, talla: $scope.tallaescogida}, function(result) {
            console.log("VAlor escogido de precio ",result.price, "CAntidad ", $scope.cantidadescogida);
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
