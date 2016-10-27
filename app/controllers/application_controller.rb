class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  def setmenucategorias
    @menucategorias = 1
  end

  def paginaActual(pagina)
    gon.paginaActual=pagina
  end

  def setMantenedores
   @mantenedores = true
 end
end
