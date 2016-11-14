class Despacho < ApplicationRecord
  has_many :paquetes, :dependent => :delete_all
  belongs_to :despachador
  belongs_to :estadodespacho, :foreign_key => :estado_id
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
                      :destino => venta.user.direccion.direccion,
                      :latitud => venta.user.direccion.location.latitud,
                      :longitud => venta.user.direccion.location.longitud
                      }
      end

      paquetes << {:idPaquete => paq.id, :bodegaId => paq.bodega.id, :bodegaDireccion => paq.bodega.direccion, :articulos => articulos}

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
end
