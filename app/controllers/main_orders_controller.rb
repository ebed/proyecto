class MainOrdersController < ApplicationController
  before_action :set_main_order, only: [:destroy]
  def destroy
    @mainorder.destroy
  end



  private
  def set_main_order
    @mainorder = MainOrder.find(params[:id])
  end
end
