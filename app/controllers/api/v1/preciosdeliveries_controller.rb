module Api
  module V1
    class PreciosdeliveriesController <  ApiController

      #Dada la direccion y el id de empresa de delivery, calcula los precios de acuerdo a distancia
    def show
      company = params[:id]
      idcliente = params[:idcliente]

      usuario = User.find(idcliente)
      dc=DeliveryCompany.find(company)

      distancia = DeliveryCompany.distanciaMinima(dc.address.direccionCompuesta, usuario.address.direccionCompuesta)
      p distancia
      distanciaKms = distancia/1000
      p distancia
      valor = Preciosdelivery.where(delivery_company_id: company).where("distanciaMinima <= ? and distanciaMaxima >= ? ",distanciaKms,distanciaKms).minimum(:precio)
      render json: {:code => 200, valor: valor}

    end

    end
  end
end
