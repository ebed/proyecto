class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show

  end

  def index

  end

  def edit

  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.create(art_params)

    if @article.save
      flash[:notice] = "Creado exitosamente"
    else
      flash[:alert] = "problemas creando"
    end
    redirect_to articles_path
  end


  def update
   if @article.update(art_params)
    flash[:notice] = "Modificado exitosamente"
  else
    flash[:alert] = "problemas modificando"
  end
    redirect_to articles_path
  end

  def destroy
    if @article.destroy
         flash[:notice] = "Eliminado exitosamente"
    else
      flash[:alert] = "problemas eliminando"
    end
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def art_params
    params.require(:article).permit(:price, :product_id, :seller_id, :marca_id)
  end

end
