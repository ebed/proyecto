class StaticPagesController < ApplicationController
  def home
    @main_articles = Article.order(:created_at).limit(5)

  end

  def about
  end

  def contact
  end

end
