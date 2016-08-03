class StaticPagesController < ApplicationController
  def home
    p "Home1"
    p params

      p "SIn filtro"
      @main_products = Product.sponsored.joins(:articles)



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

  def about
  end

  def contact
  end

  def faq

  end



end
