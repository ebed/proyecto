class Product < ApplicationRecord
  has_many :articles
  has_many :comments

  has_many :scores
  has_many :imagenesarticulos
  belongs_to :marca
  belongs_to :category


  def price_since
    self.articles.minimum(:price)
  end

  def average_score
    self.scores.average(:value)
  end

  def average_score_percent
    self.scores.average(:value)*10
  end



  def self.sponsored
    Product.joins(:imagenesarticulos).distinct.order(:created_at).limit(5)
  end

  def imagenprincipal
    self.imagenesarticulos.first
  end

  def articleselected
    self.articles.order(:price).take

  end



end
