class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(:name)

  end

  def new
    @category = Category.new
    @raiz = Category.where("category_id is null")
  end

  def create


    if category_params[:category_id] != nil

      category = Subcategory.new(category_params)

    else
      category = Category.new(category_params)

    end



    if category.save
      flash[:notice] = "Se a creado correctamente"
      redirect_to categories_path
    else
      flash[:alert] = "Falló la creación"
    end
  end

  def edit
    @raiz = Category.where("category_id is null")
  end

  def update

  end

  def destroy
    if @category.destroy
    flash[:notice] = "Se a eliminado correctamente"
      redirect_to categories_path
    else
      flash[:alert] = "Falló la eliminación"
    end

  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_id)
  end

end
