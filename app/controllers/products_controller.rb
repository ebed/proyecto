class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show

  end

  def edit

  end

  def update
    @product.update(product_params)
    @product.save
         flash[:notice] = "Se actualizo correctamente"
    redirect_to products_path

  end

  def new
    @product = Product.new
  end

  def create
    producto = Product.create(product_params)
    producto.save
         flash[:notice] = "Se creo correctamente"
    redirect_to products_path
  end


  def destroy
    @product.destroy
     flash[:notice] = "Se elimino correctamente"
    redirect_to products_path
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :marca_id, :specifications, :year)
  end
end
