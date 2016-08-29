class CarrocomprasController < ApplicationController

  def index

  end

  def show
     @articulosseleccionados = Selectedarticle.where(:user_id => current_user.id)
  end


  def new
    p "agrega"
    redirect_to root_path
  end

  def create
  end


  def additem
    p "Agregar item"
    redirect_to root_path
  end


end
