class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :setMantenedores
  def edit

  end

  def update
    p "update user"
    p userparams
    @user.update(userparams)
    if @user.save
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

  def userparams
    params.require(:user).permit(:nombre, :profile_id, :apellidos, :contact_id )
  end

end
