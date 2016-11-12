module Api
  module V1
    class UbicacionsController <  ApiController


      def create
        p params
        if params[:despacho_id].present? and params[:longitud].present? and params[:latitud].present?

          ub = Ubicacion.new(despacho_id: params[:despacho_id])

          if ub.save
            loc =Location.create(ubicacion_id: ub.id, longitud: params[:longitud], latitud: params[:latitud])
            render :json => {status: 'OK'}
          else
            render :json => {status: 'NOK'}
          end


        else
          render :json => {:status => 200, :descripcion => "Para registrar una nueva ubicacion, Se requieren los parametros: despacho_id, longitud y latitud "}
        end
      end

      def index
        @ubicaciones = Ubicacion.all
        render :json => @ubicaciones.as_json( include: { location: {only: [:latitud, :longitud]}})
      end


      def show
        resultado ={}
        if params[:despacho_id].present?
          resultado =Ubicacion.where(:despacho_id => params[:despacho_id]).order(:id).last

        else
          if params[:id].present?

            resultado=Ubicacion.find(params[:id])


          else
            resultado={:status => 200, :descripcion => "Se debe enviar solo id para recuperar la ubicacion con ese ID, y al enviar parametro despacho_id se recupera la ubicacion de un despacho particular "}
          end
        end
        render :json => resultado.as_json(include: {location: {only: [:latitud, :longitud], paquetes: {only: [:id]}}})
      end


      def destroy
        Ubicacion.find(params[:id]).destroy
      end

    end
  end
end
