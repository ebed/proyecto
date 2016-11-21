class PaymentsController < ApplicationController

  def new
    p params
    @payment = Payment.new
    @articulos = current_user.selectedarticles
      totalPagar = 0
    @articulos.each do |art|
      totalPagar = totalPagar + art.article.price
    end

    @delivery_company = DeliveryCompany.find(session[:delivery])

    gon.totalorden = totalPagar

  end

  def create

    @payment = Payment.create(payment_params)



    @morder = MainOrder.find(session[:order_id])
    @payment.total = @morder.valortotal

    @morder.payment = @payment


    @morder.statusorder_id = 2
    @morder.save
    @payment.save


    redirect_to order_path(@morder)
  end

  private
  def payment_params
    params.require(:payment).permit(:paymentmethod_id, :total, :delivery_company_id)
  end

end
