class Despacho < ApplicationRecord
  has_many :paquetes, :dependent => :delete_all
  belongs_to :despachador
  belongs_to :estadodespacho, :foreign_key => "estado_id"
  belongs_to :location


  def crea_json
    paquetes = []
    self.paquetes.each do |paq|
      articulos = []

      paq.sells.each do |venta|
        articulos << {:idProducto => venta.article.product.id,
                      :nombreProducto =>venta.article.product.name,
                      :cantidad =>  venta.cantidad,
                      :nOrden => venta.order_id,
                      :comprador => venta.user_id,
                      :destino => venta.user.address.direccionCompuesta,
                      :latitud => venta.user.address.location.latitud,
                      :longitud => venta.user.address.location.longitud
                      }
      end

      paquetes << {:idPaquete => paq.id, :bodegaId => paq.bodega.id, :bodegaDireccion => paq.bodega.address.direccionCompuesta, :articulos => articulos}

    end
    mensaje = {:despachoId => self.id, :paquetes => paquetes}
    return  mensaje
  end


  def cantidadarticulos
    total = 0
    self.paquetes.each do |paq|
      total = total + Sell.where(:paquete_id => paq.id).sum(:cantidad)
    end

    return total
  end


  def rutasDespacho
    rutasBodega=[]
    rutasCliente=[]
    totalBodegas = 0
    totalClientes = 0

    self.paquetes.each do |paquete|

        rutasBodega << { :direccion => paquete.bodega.address.direccionCompuesta }
        totalBodegas = totalBodegas +1
    end

    self.paquetes.each do |paquete|
      paquete.sells.each do |venta|
        totalClientes = totalClientes +1
        if !existeDireccion(rutasCliente, venta.user.address.direccionCompuesta)
         rutasCliente << { :direccion => venta.user.address.direccionCompuesta }
        end
      end
    end
    resultado = {:metadata => {:cantBodegas => totalBodegas, :cantClientes => totalClientes},:origen => DeliveryCompany.first.address.direccionCompuesta, :rutasBodega => rutasBodega, :rutasCliente => rutasCliente}

    return resultado
  end

  def origen
    self.paquetes.first.bodega.address.direccionCompuesta

  end


  def self.ruta

    @matrix = GoogleDistanceMatrix::Matrix.new

    @destino = GoogleDistanceMatrix::Place.new address: "Paul Harris 1000, Las Condes, La Florida, Santiago,Chile"

    # Just an example of an object responding to lat & lng.
    # Point class isn't included in this gem, but feel free to
    # create your own point class or use something like https://github.com/nofxx/georuby
    lat_lng = Point.new(lat: -33.562066, lng: -70.570258)
    @origen = GoogleDistanceMatrix::Place.new address: "Nuevo Continente 11520. La Florida"


    @matrix.origins << lat_lng << @origen
    @matrix.destinations <<@destino

    return @matrix
  end

  def existeDireccion(rutas, direccion )

    rutas.each do |r|

      if r[:direccion]  == direccion

        return true
      end

    end
    return false
  end


end
