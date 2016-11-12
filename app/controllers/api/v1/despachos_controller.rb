module Api
  module V1
    class DespachosController <  ApiController

      def show
        desp=Despacho.find(params[:id])
        render :json => desp.crea_json.to_json
      end


      def create

        if params[:despachador_id].present? and params[:paquete_id].present?
          desp = Despacho.new(despachador_id: params[:despachador_id], estado_id: 1, :paquete_id => params[:paquete_id])
          if desp.save
            render :json => {:code => 200, :despachador => desp.to_json}
          else
            render :json => {:code => 400, :descripcion => "Problemas creando el despacho"}
          end

        else
          render :json => {:code => 417, :descripcion => "Falta un parametro, tiene que venir: paquete_id y despachador_id"}
        end
      end

      def index
        render :json => {:code => 200, :despachos => Despacho.all}
      end



      def update
        if params[:id].present? and params[:paquete_id].present?

          despacho = Despacho.find(params[:id])

          paquete =  Paquete.find(params[:paquete_id])
          if paquete.present?
            despacho.paquetes << paquete
            if despacho.save
              render json: {:code => 200, :descripcion => "Despacho actualizado"}
            else
              render :json => {:code => 400, :descripcion => "Problemas actualizando el despacho"}
            end
          else
            render :json => {:code => 400, :descripcion => "Problemas actualizando el despacho, no se encuentra paquete a agregar"}
          end
        else
          render :json => {:code => 417, :descripcion => "Falta un parametro, tiene que venir: paquete_id"}
        end
      end

    end
  end
end
