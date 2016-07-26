class StaticPagesController < ApplicationController
  def home
    p "Home"
    p params
    if params[:id] != nil
      p "FIltrado"
      @main_products = Product.where(:category_id =>  params[:id])
    else
      p "SIn filtro"
      @main_products = Product.sponsored
    end


  end

  def about
  end

  def contact
  end




end
