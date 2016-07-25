class StaticPagesController < ApplicationController
  def home
    @main_products = Product.order(:created_at).limit(5)

  end

  def about
  end

  def contact
  end

end
