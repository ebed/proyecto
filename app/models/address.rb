class Address < ApplicationRecord
  has_one :tienda
  has_one :user
  has_one :location
  has_one :bodega
  has_one :delivery_company

  after_save :creaLocation


  def direccionCompuesta
    self.calle + " " + self.numero + " , " + self.comuna + " , " + self.ciudad + " , " + self.pais
  end

  def creaLocation
    p "metodo de objeto location"
    coords =  Geocoder.search(self.direccionCompuesta)
    if self.location.blank?

      resultado = Location.new
    else
      resultado = self.location


    end
      resultado.latitud = coords[0].latitude
      resultado.longitud = coords[0].longitude
      resultado.address_id = self.id
      resultado.save
    return resultado
  end
end

