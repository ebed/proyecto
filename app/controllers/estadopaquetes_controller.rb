class EstadopaquetesController < ApplicationController

before_action :setMantenedores



before_action :set_estado, only: [:show, :edit, :destroy, :update]

  def index
    @estados = Estadopaquete.all
  end

  def show

  end


  def new

    @estado = Estadopaquete.new
  end


  def create
    estado = Estadopaquete.new(estado_params)
    if estado.save
      redirect_to estadopaquetes_path
    else
      redirect_to new_estadopaquetes_path
    end

  end

  def edit
  end

  def update
    @estado.update(estado_params)
  end

  def destroy
    @estado.destroy
    redirect_to estadopaquetes_path
  end

  private
  def set_estado
    @estado = Estadopaquete.find(params[:id])
  end

  def estado_params
    params.require(:estadopaquetes).permit(:nombre, :inicio, :final)
  end
end
