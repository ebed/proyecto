module Api
  module V1
    class BodegasController <  ApiController

      def index
        bodegas = Tienda.find(params[:tienda_id]).bodegas.joins(:address)
        resultado = []

        bodegas.each do |bodega|
          resultado << {id: bodega.id, nombre: bodega.address.direccionCompuesta}

        end
        render :json => {status: 200, resultado: resultado}
      end


    end
  end
end
