module Api
  module V1
    class UbicacionsController <  ApiController


      def create
        p params

        ub = Ubicacion.new(despacho_id: params[:despacho_id])

        if ub.save
          loc =Location.create(ubicacion_id: ub.id, longitud: params[:longitud], latitud: params[:latitud])
          render :json => {status: 'OK'}

        else
          render :json => {status: 'NOK'}
        end

      end

      def index
        @ubicaciones = Ubicacion.all
        render :json => @ubicaciones.as_json( include: { location: {only: [:latitud, :longitud]}})
      end


      def show
        if params[:despacho_id].present?
          render :json => Ubicacion.where(:despacho_id => params[:despacho_id])
        else
          render :json => Ubicacion.find(params[:id])
        end


      end
    end
  end
end
