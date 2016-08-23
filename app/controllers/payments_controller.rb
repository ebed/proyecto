class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
  end

  def create
    @order = Order.find(session[:order_id])

    @order.statusorder_id = 2
    @order.save


  end

end
