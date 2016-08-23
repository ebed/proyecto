class OrdersController < ApplicationController
  before_action :set_orden, only: [:show, :pagar_orden, :preparar_orden, :enviar_orden, :cerrar_orden]

  def create
    p "creando la orden y se va a seleccionar medio de pago"
    @order = Order.create
    @order.statusorder_id = 1
    @order.fechacambio = Time.now
    @order.total = current_user.totalPagar
    @order.user_id = current_user.id
    @order.save

    current_user.selectedarticles.each do |art|
      art.order_id = @order.id
      art.inorder = true
      art.save
    end
    session[:order_id]=@order.id
    redirect_to new_payment_path
  end


  def index

    if current_user.profile.canadmin
      @orders = Order.all
    else
      if current_user.profile.cansell
        @orders = current_user.seller.orders
      end
    end
  end

  def destroy
    current_user.selectedarticles.each do |art|
      art.order_id = nil
      art.inorder = false
      art.save
    end
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to carro_path(current_user)
  end


  def show

  end

 def pagar_orden
    @order.statusorder_id = 3
    @order.save
    current_user.selectedarticles.each do |art|
      Sell.create(:user_id => current_user.id, :article_id => art.article_id )
    end
    current_user.destroyCarro


    redirect_to orders_path
  end

 def preparar_orden
    @order.statusorder_id = 6
    @order.save
    @deliver = Deliver.create(:status_id => 1, :location => 'Bodega', :haveIt => false, :order_id => @order.id)


    redirect_to orders_path
  end
 def enviar_orden
    @order.statusorder_id = 4
    @order.save
    deliver = @order.deliver
    deliver.status_id = 2
    deliver.location = 'En ruta'
    deliver.save


    redirect_to orders_path
  end

  def cerrar_orden
    @order.statusorder_id = 5
    @order.save
    deliver = @order.deliver
    deliver.status_id = 3
    deliver.location = 'Entregado'
    deliver.haveIt = true
    deliver.save

    redirect_to orders_path
  end

  private
  def set_orden
    @order = Order.find(params[:id])
  end

end
