class StaticPagesController < ApplicationController
  def home
    p "Home"
    p params
    if params[:id] != nil
      p "FIltrado"
      @main_products = Product.where(:category_id =>  params[:id]).joins(:articles)
    else
      p "SIn filtro"
      @main_products = Product.sponsored.joins(:articles)
    end


  end

  def about
  end

  def contact
  end

  def faq

  end



end
