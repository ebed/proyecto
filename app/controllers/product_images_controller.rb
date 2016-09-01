class ProductImagesController < ApplicationController

  def create
    p params

    @image = ProductImage.create(product_images)

  end

  def destroy
    @product_image =  ProductImage.find(params[:id])
    producto = @product_image.product
    @product_image.destroy
    flash[:notice] = "Se a eliminado correctamente"

    pagina = session[:pagina]
    if pagina == "editproduct"
       redirect_to edit_product_path(producto)
    else
       redirect_to addimagesproduct_path(producto)
    end


  end


  private
  def product_images
    params.require(:product_image).permit(:image, :product_id)
  end

end
