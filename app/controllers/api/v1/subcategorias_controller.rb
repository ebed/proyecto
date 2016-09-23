module Api
  module V1
    class SubcategoriasController <  ApiController

      def index

        @subcategorias = Subcategory.where(:category_id => params[:categoria])

        render :json => @subcategorias
      end
    end
  end
end
