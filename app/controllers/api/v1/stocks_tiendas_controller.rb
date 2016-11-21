module Api
  module V1
    class StocksTiendasController <  ApiController

      def index

        stocks = []
        articulos = []
        tienda = Tienda.find(params[:tienda_id])
        p tienda
        tienda.bodegas.each do |bodega|
          p bodega
          bodega.stocks.each do |stock|
            p stock
            articulos << {
              :id => stock.id,
              :artid => stock.article.id,
              :nombre => stock.article.product.name,
              :color => stock.article.color,
              :talla => stock.article.talla,
              :sexo => stock.article.sexo,
              :bodega => stock.bodega.address.direccionCompuesta,
              :stock => stock.stock
            }
          end
        end


        render :json =>{status: 200,
          articulos: articulos }

        # :resultado =>resultado.as_json(include: {location: {only: [:latitud, :longitud], paquetes: {only: [:id]}}})
      end


      def create
        p "Crea stock"
        stock = Stock.new(:bodega_id => params[:bodega_id], :article_id => params[:article_id], :stock => params[:stock])

        stock.save
        render :json => {status: 200, description: "OK"}
      end


      def destroy
        p "ELIMINANDO ", params[:id]
        stock = Stock.find(params[:id])
        p stock
        stock.destroy
      end

    end
  end
end
