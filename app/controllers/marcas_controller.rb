class MarcasController < ApplicationController
  before_action :set_marca, only: [:show, :update, :destroy, :edit]

  def index

  end


  def new
    @marca = Marca.new
  end

  def create
    @marca = Marca.create(marca_params)
    if @marca.save
      flash[:notice] = "Se creo correctamente"
    end
    redirect_to marcas_path
  end


  def edit

  end


  def update
    @marca.update(marca_params)
    if @marca.save
      flash[:notice] = "Modificado exitosamente"
    end
    redirect_to marcas_path
  end

  def destroy
    if @marca.destroy
      flash[:notice] = "Eliminado exitosamente"
    else
      flash[:alert] = "problemas eliminando"
    end
  redirect_to marcas_path
  end


  private
  def set_marca
    @marca = Marca.find(params[:id])
  end

  def marca_params
    params.require(:marca).permit(:name)
  end



end
