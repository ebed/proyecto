module Api
  module V1
    class TiendasController <  ApiController

      def index

         tiendas = Tienda.joins(:articles).where(articles: {product_id: params[:id]}).distinct

         render :json => tiendas
      end


    end
  end
end
