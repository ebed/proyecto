module Api
  module V1
    class ArticulosStocksController <  ApiController

      def index

        resultado = []


          if params[:talla].present? and params[:sexo].present? and params[:tienda_id].present? and params[:producto_id].present? and  params[:bodega_id].present?
            p "Buscando colores"
            idarts = []
             stocks = Bodega.find(params[:bodega_id]).stocks.each do |stock|
                  idarts << stock.article_id
                end

            colores =
            Article.where.not(:id => idarts).where(:tienda_id => params[:tienda_id]).
              order(:color).distinct(:color).pluck(:color)

              resultado = {tipo: "colores", resultado: colores}

          else

            if params[:sexo].present? and params[:tienda_id].present? and params[:producto_id].present? and  params[:bodega_id].present?
              p "Buscando tallas"
              idarts = []
               stocks = Bodega.find(params[:bodega_id]).stocks.each do |stock|
                  idarts << stock.article_id
                end

              tallas =
              Article.where.not(:id => idarts).where(:tienda_id => params[:tienda_id]).
                order(:talla).distinct(:talla).pluck(:talla)

                p tallas
                resultado = {tipo: "tallas", resultado: tallas}

            else

              if params[:tienda_id].present? and params[:producto_id].present? and  params[:bodega_id].present?
                p "Buscando sexo"
                idarts = []
                stocks = Bodega.find(params[:bodega_id]).stocks.each do |stock|
                  idarts << stock.article_id
                end

                sexo = Article.where.not(:id => idarts).where(:tienda_id => params[:tienda_id]).order(:sexo).distinct(:sexo).pluck(:sexo)
                resultado = {tipo: "sexos", resultado: sexo}



              else

                if params[:tienda_id].present? and  params[:bodega_id].present?
                  p "Buscando productos"
                  idarts = []

                  stocks = Bodega.find(params[:bodega_id]).stocks.each do |stock|
                    idarts << stock.article_id
                  end



                  productos_id = Article.where.not(:id => idarts).where(:tienda_id => params[:tienda_id]).
                  joins(:product).distinct(:product_id).pluck(:product_id)

                  productos_id.each do |idprod|
                    p = Product.find(idprod)
                    resultado <<  {id: p.id, nombre: p.name }
                  end
                  resultado = {tipo: "productos", resultado: resultado}

                else

                  if params[:tienda_id].present?
                  p "Buscando productos"
                  productos_id = Article.left_outer_joins(:stocks).where("stocks.stock is null").where(:tienda_id => params[:tienda_id]).
                  joins(:product).distinct(:product_id).pluck(:product_id)

                  productos_id.each do |idprod|
                    p = Product.find(idprod)
                    resultado <<  {id: p.id, nombre: p.name }
                  end
                  resultado = {tipo: "productos", resultado: resultado}

                  end
                end
              end
            end
          end
      render :json => {status: 200, :resultado => resultado}


    end




    def create
      articulo = Article.where(:product_id => params[:producto_id], :color =>  params[:color], :talla => params[:talla], :sexo => params[:sexo]).first
      p articulo
      stock = Stock.new(:article_id => articulo.id, :bodega_id => params[:bodega_id], :stock => params[:cantidad])
      p stock
      if stock.save
        render :json => {status: 200, mensaje: "CREACION EXITOSA"}
      else
        render :json => {status: 417, mensaje: "Problemas creando stock"}
      end
    end


  end

end

end
