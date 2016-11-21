class AddressesController < ApplicationController


  def new
    @address = Address.new
  end

  def create
      address = Address.new(address_params)
      if address.save

      else

      end
  end



  private
  def address_params
    params.require(:address).permit(:calle, :numero, :detalle, :comuna, :ciudad, :pais, :location_id)
  end

end
