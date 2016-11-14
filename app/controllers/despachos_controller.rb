class DespachosController < ApplicationController
  before_action :setMantenedores

  def index
    @despachos = Despacho.all
  end

  def show
    @despacho = Despacho.find(params[:id])
  end

end
