module Api
  module V1
    class DespachosController <  ApiController

      def show
        desp=Despacho.find(params[:id])
        render :json => desp.crea_json.to_json
      end


      def create
        desp = Despacho.new(despachador_id: params[:despachador_id], estado_id: 1)
        if desp.save
          render :json => {:status => 200, :despachador => desp.to_json}
        else
          render :json => {:status => 400, :descripcion => "Problemas creando el despacho"}
        end
      end


      def update

      end

    end
  end
end
