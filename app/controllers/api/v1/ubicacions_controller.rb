module Api
  module V1
    class UbicacionsController <  ApiController


      def create
        p params
        if params[:despacho_id].present? and params[:longitud].present? and params[:latitud].present?

          despacho = Despacho.find(params[:despacho_id])
          loc =Location.create(ubicacion_id: ub.id, longitud: params[:longitud], latitud: params[:latitud])
          despacho.location = loc

          if despacho.save

            render :json => {code: 200, status: 'OK'}
          else
            render :json => {code: 400, status: 'NOK'}
          end


        else
          render :json => {:code => 417, :descripcion => "Para registrar una nueva ubicacion, Se requieren los parametros: despacho_id, longitud y latitud "}
        end
      end

      def index
        @ubicaciones = Location.all
        render :json => @ubicaciones.as_json
      end


      def show
        resultado ={}
        if params[:despacho_id].present?
          resultado=Despacho.find(params[:despacho_id]).location


        else
          if params[:id].present?

            resultado=Location.find(params[:id])


          else
            render :json => {:code => 417, :descripcion => "Se debe enviar solo id para recuperar la ubicacion con ese ID, y al enviar parametro despacho_id se recupera la ubicacion de un despacho particular "}
            return
          end
        end
        render :json => { :code => 200, :resultado =>resultado.as_json(include: {location: {only: [:latitud, :longitud], paquetes: {only: [:id]}}})}
      end


      def destroy
        Ubicacion.find(params[:id]).destroy
      end



      def update
        p "Actualizando"
        if params[:despacho_id].present?
          location = Despacho.find(params[:despacho_id]).location
          location.longitud = params[:longitud]
          location.latitud = params[:latitud]
          location.save
        end


      end



    end
  end
end
