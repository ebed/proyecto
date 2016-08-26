class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
    @articulos = current_user.selectedarticles
  end

  def create
    @morder = MainOrder.find(session[:order_id])


    @morder.statusorder_id = 2
    @morder.save


  end

end
