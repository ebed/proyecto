module Api
  module V1
    class PaquetesController <  ApiController

      def create
        error=false
        resultado={ }
        descripcion=""

        paquete = Paquete.new
        paquete.estado_id = 1

        if params[:despacho_id].present?
          paquete.despacho_id = params[:despacho_id]
        else
          descripcion= "Se requiere ingresar el despacho (despacho_id) para crear el paquete inicial"
          error = true
        end


        if params[:bodega_id].present? and !error
          paquete.bodega_id = params[:bodega_id]
        else
          descripcion= "Se requiere ingresar 1 bodega (bodega_id) para crear el paquete inicial"
          error = true
        end
        if params[:sell_id].present? and !error
          if paquete.save
            sell = Sell.find(params[:sell_id])
            sell.paquete_id = paquete.id

            sell.save
            resultado = {status: 200, descripcion: "Creacion exitosa"}
          else
            resultado = {status: 400, descripcion: "Creacion fallida"}
          end
        else
            descripcion=descripcion + " - Se requiere ingresar 1 venta (sell_id) para crear el paquete inicial"
           error = true
           resultado={status: 417, descripcion: descripcion}
        end



        render :json => resultado.to_json

      end



      def index
        render json: Paquete.all.to_json
      end


      def update

        sell = Sell.find(params[:sell_id])
        sell.paquete_id = params[:id]

        if sell.save
          resultado = {status: 200, descripcion: "Creacion exitosa"}
        else
          resultado = {status: 400, descripcion: "Creacion fallida"}
        end

        render :json => resultado

      end


      def show
        p "en show de paquete"
        paquete = Paquete.find(params[:id])
        p paquete
        render :json => paquete.as_json(include: {sells: {only: [:id]}})
      end


    end
  end
end
