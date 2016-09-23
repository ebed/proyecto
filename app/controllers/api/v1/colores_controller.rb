module Api
  module V1
    class ColoresController <  ApplicationController

      def index
        @colores=[]
        prod = Product.find(params[:id]).articles
        if params[:proveedor].present?
          p "proveedor presente"
          prod = prod.where(:tienda_id => params[:proveedor])
        end
        if params[:sexo].present?
          p "Sexo presente"
          prod = prod.where(:sexo => params[:sexo])
        end
        if params[:talla].present?
          p "Talla presente"
          prod = prod.where(:talla => params[:talla])
        end
        prod.select(:color).distinct.each do |articulo|
          @colores << [articulo.color]
        end
        render :json => @colores
      end


    end
  end
end
