module Api
  module V1
    class UbicacionsController <  ApiController


      def create
        Ubicacion.create(longitud: params[:longitud], latitud: params[:latitud], order_id: params[:order_id], despachador_id: params[:despachador_id])
      end

    end
  end
end
