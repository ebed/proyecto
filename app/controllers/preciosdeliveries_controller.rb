class PreciosdeliveriesController < ApplicationController

before_action :setMantenedores



  def show
    @precio = Preciosdelivery.find(params[:id])
  end

  def index
    @precios = Preciosdelivery.all
  end

  def new
    @precio = Preciosdelivery.new
    @deliverycompanies =DeliveryCompany.all
  end

  def create
    @pdeliv = Preciosdelivery.new(preciosdelivery_params)
    if @pdeliv.save
      redirect_to preciosdeliveries_path

    else
      redirect_to new_preciosdelivery_path
    end

  end




  def edit
    @precio = Preciosdelivery.find(params[:id])
    @deliverycompanies =DeliveryCompany.all
  end

  def update
    @precio = Preciosdelivery.find(params[:id])
    @precio.update(preciosdelivery_params)

  end

  def destroy
     @precio = Preciosdelivery.find(params[:id])
     @precio.destroy
      redirect_to preciosdeliveries_path

  end


  private

  def preciosdelivery_params
     params.require(:preciosdelivery).permit(:delivery_company_id, :distanciaMinima, :distanciaMaxima, :unidadMedida, :precio )
  end
end

