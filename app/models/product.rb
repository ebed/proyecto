class Product < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :scores
  has_many :imagenesarticulos
  belongs_to :marca


  def price_since
    self.articles.minimum(:price)
  end

  def average_score
    self.scores.average(:value)
  end



end
