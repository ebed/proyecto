class BodegasController < ApplicationController
  before_action :setMantenedores

  def index
    if params[:id].present?
      @bodegas = Bodega.where(tienda_id: params[:id])
      @tienda = Tienda.find(params[:id])
    else
      @bodegas = Bodega.all
    end
  end

  def show
    @bodega = Bodega.find(params[:id])
    @address = @bodega.address
  end

  def edit
    @bodega = Bodega.find(params[:id])
    @tienda = @bodega.tienda
    @address = @bodega.address

  end


  def update

    @bodega = Bodega.find(params[:id])
    @direccion = @bodega.address
    @direccion.update(address_params)
     @bodega.update(bodegas_param)

    redirect_to bodegastienda_path(bodegas_param[:tienda_id])
  end


  def new
    @bodega = Bodega.new
    @tienda = Tienda.find(params[:id])
    @address = Address.new
  end


  def create
    bodega = Bodega.new(bodegas_param)

    address = Address.create(address_params)

    bodega.address = address

    bodega.save


    redirect_to bodegastienda_path(bodega.tienda_id)
  end

  def destroy

    bodega=Bodega.find(params[:id])
    tienda = Tienda.find(bodega.tienda_id)
    bodega.destroy
    redirect_to bodegastienda_path(tienda)
  end

  private

  def address_params
    params.require(:address).permit(:calle, :numero, :detalle, :comuna, :ciudad, :pais, :location_id)
  end

  def bodegas_param
    params.require(:bodega).permit(:id, :tienda_id, :address_id)
  end

end
