class SellsController < ApplicationController

def new

  @order = Order.new

end

def create
  p "creando la orden y se va a seleccionar medio de pago"
  @order = Order.create
  @order.total = current_user.totalPagar
  @order.save

  current_user.selectedarticles.each do |art|
    art.order_id = @order.id
    art.save
  end
  session[:order_id]=@order.id
  redirect_to new_payment_path
end


def destroy

  @selectedarticles = Selectedarticle.where(:user_id => current_user.id )
  @selectedarticles.each do |art|
    art.order_id = nil
    art.save
  end
  @order = Order.find(params[:id])
  @order.destroy
end



end
