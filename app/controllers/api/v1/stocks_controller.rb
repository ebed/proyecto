module Api
  module V1
    class StocksController <  ApiController

      def index

        stock = Article.where(:product_id => params[:id])

        if params[:proveedor].present?
          p "proveedor presente"
          stock = stock.where(:tienda_id => params[:proveedor])
        end
        if params[:sexo].present?
          p "Sexo presente"
          stock = stock.where(:sexo => params[:sexo])
        end
        if params[:color].present?
          p "Color presente"
          stock = stock.where(:color => params[:color])
        end

        if params[:talla].present?
          p "Talla presente"
          stock = stock.where(:talla => params[:talla])
        end



        render :json => stock
      end
    end
  end
end
