class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :destroy, :edit, :update]
  before_action :setMantenedores


  def show

  end

  def index
  end

  def new
    @seller = Seller.new
    @users = User.where.not(id: Seller.all.select(:user_id))
  end

  def edit
    @users = User.where.not(id: Seller.all.select(:user_id))
  end

  def create
    @s=Seller.create(seller_params)
    redirect_to @s
  end

  def update
    @seller.update(seller_params)
    redirect_to sellers_path
  end

  def destroy
     @seller.destroy
    redirect_to sellers_path
  end

  private
  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name, :user_id)
  end
end
