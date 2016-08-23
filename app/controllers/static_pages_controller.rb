class StaticPagesController < ApplicationController
  def home
    p "Home1"
    p params

      p "SIn filtro"
      @masvendidos = []
      @destacados = Product.sponsored.joins(:articles).take(8)
      @ultimos = Product.joins(:articles).order(created_at: :desc).take(8)
      listavendidos = Article.joins(:sells).group(:product_id).order('count_all desc').count.take(8)
      listavendidos.each do |masvend|
        @masvendidos<<Product.find(masvend[0])
      end


  end

 def home2
    p "Home 2"
    p params

    @main_products = Product.joins(:subcategory).where(subcategories: {category_id: params[:id]}).select(:id, :name)
    @categoria = Category.find(params[:id])

  end

 def home3
    p "Home 3"
      @main_products = Product.where(:subcategory_id =>  params[:id]).joins(:articles)
      @subcategoria = Subcategory.find(params[:id])

  end

  def search
    p "Buscando"
    @main_products = Product.search params[:search],
    page: params[:page], per_page: 10,
    order: {starttime: :desc}
  end

  def about
  end

  def contact
  end

  def faq

  end



end


