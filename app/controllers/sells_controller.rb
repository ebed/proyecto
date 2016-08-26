class SellsController < ApplicationController

def new

  @order = Order.new
  @articulos = current_user.selectedarticles
end

def create
  p "****creando la orden y se va a seleccionar medio de pago1111"
  @mainorder=MainOrder.create(user_id: current_user.id, statusorder_id: 1)

  current_user.totalxtienda.each do |item|
    idtienda = item[:tienda]
    order = Order.create(main_order_id: @mainorder.id, :qty => art.qty, :total => (art.price * art.qty))
    articulos=Selectedarticle.joins(:article).where(articles: {tienda_id: idtienda})
    articulos.each do |art|
      art.order < order
      art.save
    end
  end

  session[:order_id]=@mainorder.id
  redirect_to new_payment_path
end


def destroy

  @selectedarticles = Selectedarticle.where(:user_id => current_user.id )
  @selectedarticles.each do |art|
    art.order_id = nil
    art.save
  end
  @mainorder = MainOrder.find(params[:id])
  @mainorder.destroy
end



end
