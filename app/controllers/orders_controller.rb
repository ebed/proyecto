class OrdersController < ApplicationController
  before_action :set_orden, only: [:show, :pagar_orden, :preparar_orden, :enviar_orden, :cerrar_orden, :evaluar_orden]
  before_action :setMantenedores

  def create
    p "creando la orden y se va a seleccionar medio de pago"
    p params


  @morder = MainOrder.create(user_id: current_user.id,statusorder_id: 1, :valordespacho => params[:valordespacho], :valortotal => params[:total] )

  current_user.totalxtienda.each do |item|
    idtienda = item[:tienda]
    total = item[:total]
    order = Order.create(main_order_id: @morder.id,  :total => total, :tienda_id => idtienda)

    articulos=Selectedarticle.joins(:article).where(articles: {tienda_id: idtienda})
    articulos.each do |art|
      art.order_id =  order.id
      art.save
     end

   end
   p "TIENDA",params[:delivery_company_id]
  session[:delivery]=params[:delivery_company_id]
    session[:order_id]=@morder.id
    redirect_to new_payment_path
  end


  def index



    if current_user.profile.canadmin
      @morders = MainOrder.all
    else
      if current_user.isSeller?
        if current_user.seller.present?
          @morders = current_user.seller.orders
        end
        tiendas = Permiso.where(:user_id => current_user.id).pluck(:tienda_id)
        if tiendas.present?
          if @morders.present?
            @morders = @morders + MainOrder.joins(:orders).where(orders: {tienda_id: tiendas})
          else
            @morders = MainOrder.joins(:orders).where(orders: {tienda_id: tiendas})
        end

      end
    end
  end
end


  def orders_tienda
     @morders = MainOrder.joins(:orders).where(orders: {tienda_id: params[:id]})
     @tienda = Tienda.find(params[:id])
     render :template => 'orders/index'
  end

  def destroy
    current_user.selectedarticles.each do |art|
      art.order_id = nil
      art.inorder = false
      art.save
    end
    @order = MainOrder.find(params[:id])
    @order.destroy
    redirect_to carro_path(current_user)
  end


  def show
    if current_user.selectedarticles.present?
      @articulos = current_user.selectedarticles
    else
      @articulos = Sell.joins(order: :main_order).where(main_orders: {id: session[:order_id]})
    end
    totalPagar=0
    @articulos.each do |art|
      totalPagar = totalPagar + art.article.price
    end

    gon.totalorden = totalPagar

  end

 def pagar_orden

  ## SE crea SELL que guarda la informacion de la venta pagada
    @order.statusorder_id = 3
    @order.save
    current_user.selectedarticles.each do |art|
      p "Articulos"
      p art.order_id
      p art.order.main_order.id

      s=Sell.create(:user_id => current_user.id, :article_id => art.article_id, :order_id => art.order_id, :precio_venta => art.article.price, :cantidad => art.qty )
      p s
    end
    current_user.destroyCarro


    redirect_to orders_path
  end

 def preparar_orden
    @order.statusorder_id = 4
    @order.save
    @deliver = Deliver.create(:status_id => 1, :location => 'Bodega', :haveIt => false, :main_order_id => @order.id)


    redirect_to orders_path
  end

 def enviar_orden
    @order.statusorder_id = 5
    @order.save
    deliver = @order.deliver
    deliver.status_id = 2
    deliver.location = 'En ruta'
    deliver.save


    redirect_to orders_path
  end

  def cerrar_orden
    @order.statusorder_id = 6
    @order.save
    deliver = @order.deliver
    deliver.status_id = 3
    deliver.location = 'Entregado'
    deliver.haveIt = true
    deliver.save

    redirect_to orders_path
  end

  def evaluar_orden


  end


  private
  def set_orden
    @order = MainOrder.find(params[:id])
  end

end
