class Despacho < ApplicationRecord
  has_many :paquetes, :dependent => :delete_all
  has_one :despachador
  belongs_to :estadodespachos, :foreign_key => "estado_id"
  has_one :location, :dependent => :destroy

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
                      :destino => venta.direccion,
                      :latitud => venta.ubicacions.latitud,
                      :longitud => venta.ubicacions.longitud
                      }
      end

      paquetes << {:idPaquete => paq.id, :bodegaId => paq.bodega.id, :bodegaDireccion => paq.bodega.direccion, :articulos => articulos}

    end
    mensaje = {:despachoId => self.id, :paquetes => paquetes}
    return  mensaje
  end

end
