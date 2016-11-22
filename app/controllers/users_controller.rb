class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :setMantenedores
  def edit
    if current_user.address.blank?
      @address = Address.new
    else
      @address = current_user.address
    end
  end

  def update
    p "update user"
    p userparams
    @user.update(userparams)
    if @user.save
      address =Address.create(address_params)
      @user.address= address
      @user.save
      flash[:notice] = "Actualizado correctamente"
    else
      flash[:alert] = "Problemas actualizando"
    end
    redirect_to root_path
  end

  def index
    @habilitadosTemp = {}
    @usuarios = User.all
    @usuarios.each do |u|
      @habilitadosTemp[u.id] = u.habilitadoVendedor?
    end

    gon.habilitadosVendedores = @habilitadosTemp
  end

  def show

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:calle, :numero, :detalle, :comuna, :ciudad, :pais, :location_id)
  end
  def userparams
    params.require(:user).permit(:nombre, :profile_id, :apellidos, :contact_id )
  end

end
