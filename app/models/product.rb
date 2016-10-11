class Product < ApplicationRecord

  has_many :articles, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all

  has_many :product_images, :dependent => :delete_all


  has_many :scores, :dependent => :delete_all
  belongs_to :marca
  belongs_to :subcategory


  attr_accessor :category_id

  def price_since
    self.articles.minimum(:price)
  end

  def average_score
    self.scores.average(:value)
  end

  def average_score_percent
    if self.scores.count > 0
      return self.scores.average(:value)*10
    else
      return 0
    end
  end



  def self.sponsored
    Product.joins(:product_images).distinct.order(:created_at).limit(5)
  end

  def imagenprincipal
    self.product_images.first.image.url(:square)
  end

  def imagenprincipalthumb
    self.product_images.first.image.url(:thumb)
  end

  def articleselected
    self.articles.order(:price).take
  end

  def self.search(search,page)
    wildcard_search = "%#{search}%"
    joins(:marca, :subcategory).where("products.name LIKE ? or products.specifications LIKE ? or marcas.name LIKE ? or subcategories.name LIKE ?", wildcard_search, wildcard_search, wildcard_search, wildcard_search)
  end


  def tiendas
    Tienda.joins(:articles).where(articles: {product_id: self.id})

  end



end

