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


 def agregaracarro
    p "Agrega a carro"
    p params

    articulo = Article.where(:product_id => params[:producto], :tienda_id => params[:proveedor]).first

    temp = Selectedarticle.where(:user_id => current_user.id, :article_id =>  articulo.id).first

    if temp != nil && temp.qty > 0
        qty = temp.qty
        p "Se agregan items de articulos ya escogidos",qty
        qty = qty + params[:cantidad].to_f
        p "Se agregan items de articulos ya escogidos",qty
       art = Selectedarticle.where(:user_id => current_user.id, :article_id =>  articulo.id).first
        p art
       art.update(:qty =>  qty)
      flash[:notice]="Se agregaron los articulos a su carro correctamente"

    else
      newitem = Selectedarticle.new(:article_id => articulo.id, :qty => params[:cantidad], :user_id => current_user.id)
      if newitem.save
        flash[:notice]="Se agrego correctamente"

      else
        flash[:notice]="Problemas agregando al carro"
      end
    end

    redirect_to Product.find(params[:producto])



  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :marca_id, :specifications, :year, :category_id, :subcategory_id)
  end


  def imagen_params
    params.require(:imagenesarticulo).permit(:file, :product_id, :order)
  end

end
