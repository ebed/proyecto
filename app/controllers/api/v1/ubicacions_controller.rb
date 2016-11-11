module Api
  module V1
    class UbicacionsController <  ApiController


      def create
        p params
        ub = Ubicacion.new(longitud: params[:longitud], latitud: params[:latitud], despacho_id: params[:despacho_id])

        if ub.save
          render :json => {status: 'OK'}

        else
          render :json => {status: 'NOK'}
        end

      end

      def index
        ubicaciones = Ubicacion.all
        render :json => ubicaciones
      end
    end
  end
end
