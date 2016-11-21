class PaquetesController < ApplicationController
before_action :setMantenedores

  def index
    @paquetes = Paquete.all
  end


  def edit

  end

  def new

    bodegas = Sell.joins(article: {tienda: :bodegas}).pluck("bodegas.id")

    @articulosBodegas = []
    @paquete = Paquete.new

    bodegas.each do |bodega|

      b=Bodega.find(bodega)
      arts = Sell.joins(:article).where(articles: {tienda_id: b.tienda_id}, :paquete_id => nil)
      @articulosBodegas.push({:bodega => b, :articulos => arts})
    end

    p @articulosBodegas
  end


  def create

# recuperar bodegas y articulos


    ventas= params[:paquete][:sells]
    ventas.shift
    p ventas
    ## Realizamos copia de ventas a navegar
    copiaVentas = ventas
    ventas.each do |venta_id|
      sell = Sell.find(venta_id)
      morder = sell.order.main_order

      ## Verificamos si hay mas bodegas

      if morder.bodegas.size > 1
        ## Caso de mas de 1 bodega

      else
        if morder.bodegas.size == 0
          ## Caso que no existan bodegas
        else
          ## Caso de solo 1 bodega

          paquete = Paquete.new
          paquete.estado_id = 1
          paquete.bodega_id=morder.bodegas.first
          paquete.save

          articulos = getArticulosBodega(copiaVentas,morder.bodegas.first)
          articulos.each do |idarticulo|
            venta = Sell.find(idarticulo)
            venta.paquete = paquete

            venta.save
          end
        end
      end
  end
  redirect_to paquetes_path
end



  def destroy
    @paquete = Paquete.find(params[:id])
    @ventas = @paquete.sells

    @ventas.each do |venta|
      venta.paquete_id = nil
      venta.save

    end

    @paquete.destroy
    redirect_to paquetes_path

  end

  private
  def paquete_params

  end

  def getArticulosBodega(ventas, bodega)
    articulos = []
    ventas.each do |venta|
      if getBodega(venta).id == bodega
        articulos << venta
      end
    end

  end


  def getBodega(sell)

    Sell.find(sell).article.tienda.bodegas.first
  end



end
