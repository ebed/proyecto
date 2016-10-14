class BannersController < ApplicationController
  before_action :set_banner, only: [:show]

  def index
    @banners = Banner.all
  end


  def show

  end

  def new
    @banner = Banner.new

  end

  def create
    banner=Banner.new(banner_params)
    if banner.save
      redirect_to banners_path
    end
  end

  def destroy

  end

  private
  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit(:imagen, :descripcion)
  end
end
