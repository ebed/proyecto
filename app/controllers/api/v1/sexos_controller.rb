module Api
  module V1
    class SexosController <  ApplicationController

      def index
        @sexo=[];
         prod = Product.find(params[:id]).articles
         if params[:proveedor].present?
          p "proveedor presente"
          prod = prod.where(:tienda_id => params[:proveedor])
        end

        prod.select(:sexo).distinct.each do |articulo|
            @sexo << [articulo.sexo]
         end
         p @sexo
         render :json => @sexo
      end


    end
  end
end
