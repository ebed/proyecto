class CarrosController < ApplicationController
  before_action :set_art, only: [:destroy]

  def index

  end

  def show
     @articulosseleccionados = Selectedarticle.where(:user_id => current_user.id)

  end


  def new
    p "agrega en CarrosController"
    p params

    qty = Selectedarticle.where(:user_id => current_user.id, :article_id =>  params[:art_id]).count
    if qty > 0
       art = Selectedarticle.where(:user_id => current_user.id, :article_id =>  params[:art_id])
       art.update(:qty => qty +1)

    else
      newitem = Selectedarticle.new(:article_id => params[:art_id], :qty => qty+1, :user_id => current_user.id)
      if newitem.save
        flash[:notice]="Se agrego correctamente"

      else
        flash[:notice]="Problemas agregando al carro"
      end
    end


    redirect_to root_path
  end


  def create
  end

  def destroy
    @art.destroy
    redirect_to carro_path
  end

  def additem
    p "Agregar item"
    redirect_to root_path
  end


  private
  def set_carro

  end

  def set_art
    @art = Selectedarticle.find(params[:id])
  end


end
