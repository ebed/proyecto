

app=angular.module('app',["ngAnimate","ngResource"]);
app.directive('slideable', function () {
    return {
        restrict:'C',
        compile: function (element, attr) {
            // wrap tag
            var contents = element.html();
            element.html('<div class="slideable_content" style="margin:0 !important; padding:0 !important" >' + contents + '</div>');

            return function postLink(scope, element, attrs) {
                // default properties
                attrs.duration = (!attrs.duration) ? '1s' : attrs.duration;
                attrs.easing = (!attrs.easing) ? 'ease-in-out' : attrs.easing;
                element.css({
                    'overflow': 'hidden',
                    'height': '0px',
                    'transitionProperty': 'height',
                    'transitionDuration': attrs.duration,
                    'transitionTimingFunction': attrs.easing
                });
            };
        }
    };
});
app.directive('slideToggle', function() {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var target, content;

            attrs.expanded = false;

            element.bind('click', function() {
                if (!target) target = document.querySelector(attrs.slideToggle);
                if (!content) content = target.querySelector('.slideable_content');

                if(!attrs.expanded) {
                    content.style.border = '1px solid rgba(0,0,0,0)';
                    var y = content.clientHeight;
                    content.style.border = 0;
                    target.style.height = y + 'px';
                } else {
                    target.style.height = '0px';
                }
                attrs.expanded = !attrs.expanded;
            });
        }
    }
});

app.factory('Sexos',['$resource',function($resource) {
    return $resource(
        '/api/sexos',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);


app.factory('Colores',['$resource',function($resource) {
    return $resource(
        '/api/colores',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);

app.factory('Tallas',['$resource',function($resource) {
    return $resource(
        '/api/tallas',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);


app.factory('Tiendas',['$resource',function($resource) {
    return $resource(
        '/api/tiendas',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);



app.factory('Articulos',['$resource',function($resource) {
    return $resource(
        '/api/articulos',
        {},
        {
            get: { method: 'GET'}
        }
        )
}]);


app.controller('appController',
        ['$rootScope','$scope','$animate','$resource','Sexos', 'Colores', 'Tallas', 'Tiendas','Articulos',
        function($rootScope,$scope,$animate,$resource, Sexos, Colores, Tallas, Tiendas, Articulos) {


    var categoryActive=0;
    $scope.colores={};
    $scope.test ="TEST";
    $scope.currentIndexImage=-1;
    $scope.imagen ="";
    $scope.firsttime = true;

    $scope.habilitadoSexo=false;
    $scope.habilitadoColor=false;
    $scope.habilitadoTalla=false;
    $scope.habilitadoCantidad=false;
    $scope.habilitadoAgrega=false;

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

$scope.items = [{
  id: 1,
  label: 'aLabel',
  subItem: { name: 'aSubItem' }
}, {
  id: 2,
  label: 'bLabel',
  subItem: { name: 'bSubItem' }
}];

  }
]);
