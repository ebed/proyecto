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

    temp = Selectedarticle.where(:user_id => current_user.id, :article_id =>  params[:art_id]).first

    if temp != nil && temp.qty > 0
        qty = temp.qty
        p "Se agregan items de articulos ya escogidos",qty
        qty = qty +1
        p "Se agregan items de articulos ya escogidos",qty
       art = Selectedarticle.where(:user_id => current_user.id, :article_id =>  params[:art_id]).first
        p art
       art.update(:qty =>  qty)

    else
      newitem = Selectedarticle.new(:article_id => params[:art_id], :qty => 1, :user_id => current_user.id)
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
