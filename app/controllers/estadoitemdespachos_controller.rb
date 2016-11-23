class EstadoitemdespachosController < ApplicationController

before_action :set_estado, only: [:show, :edit, :destroy, :update]

before_action :setMantenedores



  def index
    @estados = Estadoitemdespacho.all
  end

  def show

  end


  def new

    @estado = Estadoitemdespacho.new
  end


  def create
    estado = Estadoitemdespacho.new(estado_params)
    if estado.save
      redirect_to estadoitemdespachos_path
    else
      redirect_to new_estadoitemdespachos_path
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
    @estado = Estadoitemdespacho.find(params[:id])
  end

  def estado_params
    params.require(:estadoitemdespachos).permit(:nombre, :inicio, :final)
  end
end
