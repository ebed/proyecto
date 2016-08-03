class ImagenesarticulosController < ApplicationController
  before_action :set_imagen, only: [:show, :edit, :destroy, :update]

  def show

  end

  def index
    @imagenes = Imagenesarticulo.all
  end



  def new
    @imagen = Imagenesarticulo.new

  end

  def create

    p "Creando el articulo"
    @imagen = Imagenesarticulo.new(imagen_params)
    p imagen_params
    if @imagen.save
      p "Se creo!!!!"
      flash[:notice] = "Se creo correctamente"

    else
      p "Falló"
      flash[:alert] = "Problemas creando"

    end
    redirect_to imagenesarticulos_path
  end

  def destroy
    @imagen.destroy
    redirect_to imagenesarticulos_path
  end

  private
  def set_imagen
    @imagen = Imagenesarticulo.find(params[:id])
  end

  def imagen_params
    params.require(:imagenesarticulo).permit(:file, :product_id, :order, :image)
  end
end
