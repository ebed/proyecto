class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show

  end

  def index

  end

  def edit
    p params
  end



  def new
    p "Agregando articulo"
    @article = Article.new
    @tienda = Tienda.find(params[:id])
  end

  def create

    @article = Article.create(art_params)
    @tienda = Tienda.find(@article.tienda_id)

    if @article.save
      flash[:notice] = "Creado exitosamente"
    else
      flash[:alert] = "problemas creando"
    end
    redirect_to tienda_path(@tienda)
  end


  def update
    p art_params
    @tienda = Tienda.find(@article.tienda_id)
   if @article.update(art_params)
    flash[:notice] = "Modificado exitosamente"
  else
    flash[:alert] = "problemas modificando"
  end
    redirect_to tienda_path(@tienda)
  end

  def destroy
    @tienda = Tienda.find(@article.tienda_id)
    if @article.destroy
         flash[:notice] = "Eliminado exitosamente"
    else
      flash[:alert] = "problemas eliminando"
    end
    redirect_to tienda_path(@tienda)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def art_params
    params.require(:article).permit(:price, :product_id, :tienda_id, :marca_id, :stock, :color, :segmento, :talla, :sexo, :price_buy)
  end

end
