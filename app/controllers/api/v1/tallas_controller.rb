module Api
  module V1
    class TallasController <  ApplicationController

      def index
        @tallas=[]
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
        prod.select(:talla).distinct.each do |articulo|
          @tallas << [articulo.talla]
        end
        render :json => @tallas
      end
    end
  end
end
