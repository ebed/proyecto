class TiendasController < ApplicationController
  def index
    if user_signed_in?

        vendedor = Seller.where(user_id: current_user.id).first

          @tiendas = Tienda.where(seller_id: vendedor.id)

    end
  end




  def show
    @tienda = Tienda.find(params[:id])

  end

  def new
    @vendedor = Seller.where(user_id: current_user.id).first
    p @vendedor
    @tienda = Tienda.new
    @contact = Contact.new
  end


  def create
    p tienda_params
    tienda = Tienda.new(tienda_params)
    if tienda.save
      flash[:notice] = "Se a creado correctamente"
      redirect_to tiendas_path
    else
      flash[:alert]
    end

  end


  def destroy
    if Tienda.find(params[:id]).destroy
      flash[:notice] = "Se a eliminado correctamente"
      redirect_to tiendas_path
    else
      flash[:alert] ="Problemas eliminando"
    end
  end

  private
  def tienda_params
    params.require(:tienda).permit(:name, :seller_id, {:contact => [:contactype_id, :value]})
  end
end
