class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :destroy, :edit, :update]

  def index
    @banners = Banner.all
  end


  def show

  end

  def new
    @banner = Banner.new

  end

  def edit

  end

  def update
    p "Update de banner"
    @banner.update(banner_params)
    redirect_to banners_path

  end


  def create
    banner=Banner.new(banner_params)
    if banner.save
      redirect_to banners_path
    end
  end

  def destroy
    @banner.destroy
    redirect_to banners_path
  end

  private
  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit(:imagen, :descripcion, :tipobanner_id, :operativo)
  end
end
