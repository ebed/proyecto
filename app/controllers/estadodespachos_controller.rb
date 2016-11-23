class EstadodespachosController < ApplicationController
before_action :setMantenedores
before_action :set_estado, only: [:show, :edit, :destroy, :update]

  def index
    @estados = Estadodespacho.all
  end

  def show

  end


  def new

    @estado = Estadodespacho.new
  end


  def create
    estado = Estadodespacho.new(estado_params)
    if estado.save
      redirect_to estadodespachos_path
    else
      redirect_to new_estadodespachos_path
    end

  end

  def edit
  end

  def update
    @estado.update(estado_params)
  end

  def destroy
    @estado.destroy
    redirect_to estadodespachos_path
  end

  private
  def set_estado
    @estado = Estadodespacho.find(params[:id])
  end

  def estado_params
    params.require(:estadodespachos).permit(:nombre, :inicio, :final)
  end
end
