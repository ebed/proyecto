
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

app.factory('Scores',['$resource',function($resource) {
    return $resource(
        '/api/evaluaciones',
        {},
        {
            get: {method: 'GET' },
            put: {method: 'POST'}
        })
}])



app.factory('SellersCreate',['$resource',function($resource) {
    return $resource(
        '/api/sellers',
        {user_id: '@user_id'},
        {

            put: {method: 'POST'},

        })
}])

app.factory('Sellers',['$resource',function($resource) {
    return $resource(
        '/api/sellers/:user_id',
        {user_id: '@user_id'},
        {


            get: {method: 'GET' },
            delete: {method: 'DELETE'}
        })
}])


app.factory('Permisos',['$resource',function($resource) {
    return $resource(
        '/api/permisos',
        {},
        {
            query: {method: 'GET',isArray:true },
            put: {method: 'POST'}
        })
}])


app.factory('Permisos2',['$resource',function($resource) {
    return $resource(
        '/api/permisos/:user_id',
        {user_id: '@user_id'},
        {

            delete: {method: 'DELETE'}
        })
}])


app.factory('Users',['$resource',function($resource) {
    return $resource(
        '/api/users',
        {},
        {
            query: {method: 'GET',isArray:true }
        })
}])



app.factory('Imagenes',['$resource',function($resource) {
    return $resource(
        '/api/imagenes',
        {},
        {
            query: {method: 'GET',isArray:true }
        })
}])


app.factory('DeliveryCompany',['$resource',function($resource) {
    return $resource(
        '/api/delivery_companies',
        {},
        {
            query: {method: 'GET'  }
        })
}])


app.factory('StocksTiendas',['$resource',function($resource) {
    return $resource(
        '/api/stocks_tiendas',
        {},
        {
            query: {method: 'GET'},

        })
}])

app.factory('StocksTiendas2',['$resource',function($resource) {
    return $resource(
        '/api/stocks_tiendas/:id',
        {},
        {
            delete: {method: 'DELETE'}
        })
}])

app.factory('StocksArticulos',['$resource',function($resource) {
    return $resource(
        '/api/articulos_stocks',
        {},
        {
            query: {method: 'GET'},
            create: {method: 'POST'}
        })
}])

app.factory('Bodegas',['$resource',function($resource) {
    return $resource(
        '/api/bodegas',
        {},
        {
            query: {method: 'GET'}
        })
}])
app.factory('PreciosDelivery',['$resource',function($resource) {
    return $resource(
        '/api/preciosdeliveries/:id',
        {},
        {
            get: {method: 'get'}
        })
}])
