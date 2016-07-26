class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @comment = Comment.new

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

    producto = Product.new(product_params)


    if producto.save
        p "Creacion OK"
         flash[:notice] = "Se creo correctamente"
         redirect_to addimagesproduct_path producto
      else
        p "Creacion fallida"
          flash[:alert] = "Problema creando"
          redirect_to products_path
    end
 end


 def addimages
   p "Creando la imagen"

    p params
    @imagen = Imagenesarticulo.new

    ##imagen = Imagenesarticulo.new(imagen_params)
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
    params.require(:product).permit(:name, :marca_id, :specifications, :year, :category_id)
  end


  def imagen_params
    params.require(:imagenesarticulo).permit(:file, :product_id, :order)
  end

end
