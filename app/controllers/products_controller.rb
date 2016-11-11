class ProductsController < ApplicationController
before_action :set_product, only: [ :edit, :update, :destroy]
before_action :setmenucategorias, only: [:show]
before_action :setMantenedores, only: [:index, :new, :create, :edit, :update, :destroy]
  def index
  end



  def show
    p params
  @product = Product.find(params[:id])
    @comment = Comment.new
    @imagenesproducto = {:vacio => ""}
    @imagenes = @product.imagenes
     p @imagenes
    @imagenes.each do |imagen|
      @imagenesproducto[imagen.id] =imagen.imagen.url(:medium)
    end
    if params[:idtienda].present?
      gon.tiendaprecargada = Tienda.find(params[:idtienda])
    else gon.tiendaprecargada =0
    end
    gon.imagenesproducto = @imagenesproducto



    gon.id_producto = params[:id]


  end




  def edit

  end

  def update
    @product.update(product_params)
    @product.save
     if params[:images]
        #===== The magic is here ;)
        params[:images].each do |image|
          @product.product_images.create(image: image)
        end
      end
      flash[:notice] = "Se actualizo correctamente"
    redirect_to products_path

  end

  def new
    @product = Product.new

  end

  def create


    #recupero variable subcategoria que se seteo por angular

    product_params[:subcategory_id] = params[:subcategory_id]
    p "ID subcategoria", params[:subcategory_id]
    p params
    @producto = Product.new(product_params)
    @producto.subcategory_id = params[:subcategory_id]

    if @producto.save

        p "Creacion OK"
         flash[:notice] = "Se creo correctamente"
         redirect_to addimagesproduct_path(@producto)
      else
        p "Creacion fallida"
          flash[:alert] = "Problema creando"
          redirect_to products_path
    end
 end


 def addimages
   p "Creando la imagen"
   @product = Product.find(params[:id])
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

    idProveedor= params[:proveedor].split(':')[1]

    articulo = Article.articulo(params[:producto], params[:talla] , params[:color],params[:proveedor], params[:sexo]   )
    p articulo
  #  articulos = Article.where(:product_id => params[:producto], :tienda_id => params[:proveedor])

    temp = Selectedarticle.where(:user_id => current_user.id, :article_id =>  articulo.id).first

      if !temp.nil?
          qty = temp.qty
          p "Se agregan items de articulos ya escogidos",qty
          qty = qty + params[:cantidad].to_f
          p "Se agregan items de articulos ya escogidos",qty
         art = Selectedarticle.where(:user_id => current_user.id, :article_id =>  articulo.id).first
          p art
         art.update(:qty =>  qty)
         articulo.stock = articulo.stock - params[:cantidad].to_f
         articulo.save
        flash[:notice]="Se agregaron los articulos a su carro correctamente"

      else
        newitem = Selectedarticle.new(:article_id => articulo.id, :qty => params[:cantidad], :user_id => current_user.id)

        if newitem.save
          articulo.stock = articulo.stock - params[:cantidad].to_f
          articulo.save
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
    params.require(:product).permit(:name, :marca_id, :specifications, :year, :category_id, :subcategory_id, :avatar, :tienda_id, :sexo, :color, :talla)
  end


  def imagen_params
    params.require(:imagenesarticulo).permit(:file, :product_id, :order)
  end

end
