module Api
  module V1
    class ImagenesController <  ApiController

      def index

        if params[:idimagen].present?
          resultado = true
          p "imagen presente"
          article = ImagenesArticulo.find(params[:idimagen]).article
          p article
          if params[:proveedor].present? and !params[:proveedor].blank?
            p "Con proveedor",params[:proveedor]
            resultado = resultado & article.tienda_id == params[:proveedor]

          end

          if params[:sexo].present? and !params[:sexo].blank?
             p "Con sexo",params[:sexo]
             resultado = resultado & article.sexo == params[:sexo]

          end

          if params[:color].present? and !params[:color].blank?
              p "Con color",params[:color]
             resultado = resultado & article.color == params[:color]

          end

          if params[:talla].present? and !params[:talla].blank?
             p "Con talla",params[:talla]
             resultado = resultado & article.sexo == params[:talla]

          end
          p "Resultado servicio valida imagen",resultado
          render :json => resultado
          return
        end


        articulos = Product.find(params[:id]).articles
        if params[:tam].present?
          tamano = params[:tam]
        else
          tamano = original
        end
        @imagenes=[]


        p "Parametros ",params
        if params[:proveedor].present?
          p "proveedor presente"
          articulos = articulos.where(:tienda_id => params[:proveedor])
        end
        if params[:sexo].present?
          p "Sexo presente"
          articulos = articulos.where(:sexo => params[:sexo])
        end
        if params[:color].present?
          p "Color presente"
          articulos = articulos.where(:color => params[:color])
        end

        if params[:talla].present?
          p "Talla presente"
          articulos = articulos.where(:talla => params[:talla])
        end

        articulos.each do |articulo|
          articulo.imagenes_articulos.each do |imagen|

            img = {url: imagen.imagen(tamano.to_s), id: imagen.id}
            @imagenes.push img
          end
        end
        p @imagenes

        render :json => @imagenes

      end



    end
  end
end
