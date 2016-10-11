
app.factory('Sexos',['$resource',function($resource) {
    return $resource(
        '/api/sexos',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);

app.factory('Stocks',['$resource',function($resource) {
    return $resource(
        '/api/stocks',
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




app.factory('Categorias',['$resource',function($resource) {
    return $resource(
        '/api/categorias',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);

app.factory('Subcategorias',['$resource',function($resource) {
    return $resource(
        '/api/subcategorias',
        {},
        {
            get: { method: 'GET',isArray:true}
        }
        )
}]);
