class TiendasController < ApplicationController
  before_action :setMantenedores



  def index
    if user_signed_in? and current_user.isSeller?

        vendedor = Seller.where(user_id: current_user.id).first
        tienda_ids = Permiso.where(user_id: current_user.id).pluck(:tienda_id)
        @tiendas_secundarias =  Tienda.where(id: tienda_ids)
        if vendedor.blank?
          @tiendas = nil
        else
          @tiendas = Tienda.where(seller_id: vendedor.id)
        end
      else
        flash[:alert] = "No puede ver tienda, no es un vendedor, hable con el administrador"
        redirect_to root_path

    end
  end

  def edit
     @tienda = Tienda.find(params[:id])
     @vendedor = Seller.where(user_id: current_user.id).first

  end

  def update
    @tienda = Tienda.find(params[:id])
    p tienda_params
    @tienda.update(tienda_params)
    redirect_to @tienda
  end


  def show
    @tienda = Tienda.find(params[:id])
    @scores = ScoreTienda.where(:tienda_id => @tienda.id)

  end

  def new
    @vendedor = Seller.where(user_id: current_user.id).first

    @tienda = Tienda.new
    @tienda.contacts.new
    @contact = Contact.new
  end


  def create
    p tienda_params
    tienda = Tienda.new(tienda_params)

    if tienda.save
    #  flash[:notice] = "Se a creado correctamente"
      redirect_to tiendas_path
    else
      flash[:alert]
    end

  end

  def all
    @tiendas = Tienda.all
  end

  def destroy
    if Tienda.find(params[:id]).destroy
      flash[:notice] = "Se a eliminado correctamente"
      redirect_to tiendas_path
    else
      flash[:alert] ="Problemas eliminando"
    end
  end


  def dashboard
    @tienda = Tienda.find(params[:id])

    @data = [{day: '1', value: 12}, {day: '2', value: 18}]


  end


  def editarAccesos
    @tienda = Tienda.find(params[:id])
    @scores = ScoreTienda.where(:tienda_id => @tienda.id)
    gon.tienda_id = @tienda.id

  end

  private



  def tienda_params
    params.require(:tienda).permit(:name, :seller_id, :imagen,  contacts_attributes:[:contactype_id, :value])
  end

end


