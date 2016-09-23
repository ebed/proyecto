module Api
  module V1
    class ArticulosController <  ApplicationController

      def index

       prod = Product.find(params[:id]).articles
        if params[:proveedor].present?
          p "proveedor presente"
          prod = prod.where(:tienda_id => params[:proveedor])
        end
        if params[:sexo].present?
          p "Sexo presente"
          prod = prod.where(:sexo => params[:sexo])
        end
        if params[:color].present?
          p "Color presente"
          prod = prod.where(:color => params[:color])
        end

        if params[:talla].present?
          p "Talla presente"
          prod = prod.where(:talla => params[:talla])
        end



        render :json => prod.first

      end
    end
  end
end
