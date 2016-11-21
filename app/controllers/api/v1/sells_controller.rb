module Api
  module V1
    class SellsController <  ApiController

      def show
        resultado ="NO"
        code= 400
        sell = Sell.find(params[:id])
        if !sell.blank?
          resultado = sell
        end
        render :json => {code: code, resultado: resultado}
      end

      def index


        render json: Sell.all

      end


      def update
         sell = Sell.find(params[:id])
         estado = params[:estadoitem]
         if sell.update(:estadoitemdespacho_id => estado.to_i)
          render :json => {code: 200, descripcion: "Operacion exitosa"}
         else

          render :json => {code: 400, descripcion: "Operacion no finalizada"}
         end

      end



    end
  end
end
