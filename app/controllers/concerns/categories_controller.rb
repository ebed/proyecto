class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.where("category_id is null").order(:name)
  end

  def new
    @category = Category.new
    @raiz = Category.where("category_id is null")
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:notice] = "Se a creado correctamente"
      redirect_to categories_path
    else
      flash[:alert] = "Falló la creación"
    end
  end

  def edit

  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_id)
  end

end
