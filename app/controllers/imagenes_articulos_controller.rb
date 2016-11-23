class ImagenesArticulosController < ApplicationController

  def create

    p "Atributos ",params
    @imagen = ImagenesArticulo.create(imagenesarticuloparams)
    @article = Article.find(imagenesarticuloparams[:article_id])

  end

  private
  def imagenesarticuloparams
     params.require(:imagenes_articulo).permit(:article_id, :imagen)
  end

end
