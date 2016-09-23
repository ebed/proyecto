module Api
  module V1
    class CategoriasController <  ApiController

      def index
        @categorias = Category.all
        render :json => @categorias
      end
    end
  end
end
