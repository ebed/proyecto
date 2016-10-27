class StaticPagesController < ApplicationController
  before_action :setmenucategorias, only: [:destacados, :masvendidos, :home, :home2, :home3, :ultimos]
  def home
    p "Home1"
    p params

      p "SIn filtro"
      @masvendidos = []
      @destacados = Product.sponsored.joins(:articles).take(18)
      @ultimos = Product.joins(:articles).group('id').order(created_at: :desc).take(18)
      listavendidos = Article.joins(:sells).group(:product_id).order('count_all desc').count.take(18)
      listavendidos.each do |masvend|
        @masvendidos<<Product.find(masvend[0])
      end
      p "Mas vendidos"
      p @masvendidos
      p "ultimos"
      p @ultimos
      p "destacados"
      p @destacados


  end

 def home2
    p "Home 2"
    p params



    @main_products = Product.joins(:subcategory).where(subcategories: {category_id: params[:id]}).select(:id, :name, :marca_id)
    @textobuscado= Category.find(params[:id]).name
    @banner = Banner.where(:pagina=> @textobuscado, :operativo => true).order(:updated_at).first

    paginaActual(params[:id])
  end

 def home3
    p "Home 3"
      @main_products = Product.where(:subcategory_id =>  params[:id]).joins(:articles).distinct
      @subcategoria = Subcategory.find(params[:id])
      @textobuscado = @subcategoria.name

  end

  def destacados

    @main_products = Product.joins(:subcategory).where(subcategories: {category_id: params[:id]}).select(:id, :name, :marca_id)
    @destacados = Product.sponsored.joins(:articles).take(18)
    @carrusel = Banner.joins(:tipobanner).where(tipobanners: {:name => "CARRUSEL"}, :operativo => true).order(:updated_at)
    @banner = Banner.joins(:tipobanner).where(tipobanners: {:name => "DESTACADO"}, :operativo => true).order(:updated_at).first

    paginaActual("destacados")
  end

  def ultimos
      @ultimos = Product.joins(:articles).group('id').order(created_at: :desc).take(18)
      @banner = Banner.joins(:tipobanner).where(tipobanners: {:name=> "ULTIMOS"}, :operativo => true).order(:updated_at).first
      paginaActual("ultimo")
  end


  def masvendidos
      @masvendidos = []

      listavendidos = Article.joins(:sells).group(:product_id).order('count_all desc').count.take(18)
      listavendidos.each do |masvend|
        @masvendidos<<Product.find(masvend[0])
      end
      @banner = Banner.joins(:tipobanner).where(tipobanners: {:name => "MASVENDIDOS"}, :operativo => true).order(:updated_at).first
      paginaActual("vendidos")

  end

  def search
    p "Buscando"
    @main_products = Product.search params[:search],
    page: params[:page], per_page: 10,
    order: {starttime: :desc}
  end

  def listaxmarca
    p "Productos de marca"

    @productos = Product.where(:marca_id => params[:id])
    @marca = Marca.find( params[:id])

  end

  def articulostienda
    @main_products = Product.joins(:articles).where(articles: {:tienda_id => params[:id]}).distinct
    @textobuscado = "TIENDA  "+Tienda.find(params[:id]).name
    @idtienda = params[:id]
  end

  def about
  end

  def contact
  end

  def faq

  end



end


