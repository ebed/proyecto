app = angular.module('app',['ngAnimate']).directive('slideable', function () {
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
})
.directive('slideToggle', function() {
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





app.controller('appController', ['$rootScope','$scope','$animate', function($rootScope,$scope) {
    var categoryActive=0;

    $scope.currentIndexImage=-1;
    $scope.imagen ="";
    $scope.firsttime = true;

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

