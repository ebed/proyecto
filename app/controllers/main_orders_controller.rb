class MainOrdersController < ApplicationController
  before_action :set_main_order, only: [:destroy]
  def destroy
    if @mainorder.destroy
      flash[:notice]="Orden eliminada correctamente"
    else
      flash[:alert]="Problemas eliminando orden"

    end
    redirect_to orders_path
  end



  private
  def set_main_order
    @mainorder = MainOrder.find(params[:id])
  end
end
