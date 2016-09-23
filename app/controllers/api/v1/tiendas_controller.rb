module Api
  module V1
    class TiendasController <  ApplicationController

      def index

         tiendas = Tienda.joins(:articles).where(articles: {product_id: params[:id]}).distinct

         p tiendas
         render :json => tiendas
      end


    end
  end
end
