class Product < ApplicationRecord

  has_many :articles, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all

  has_many :scores, :dependent => :delete_all
  has_many :imagenesarticulos, :dependent => :delete_all
  belongs_to :marca
  belongs_to :subcategory


  has_attached_file :avatar,
                     styles: {
                      thumb: '100x100>',
                      square: '200x200#',
                      medium: '300x300>'
                    },

                    default_url: "/images/:style/missing.png",
                    :url => ":s3_domain_url",
                    :path => 'products/avatars/000/000/003/:style/:basename.:extension'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

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
    Product.joins(:imagenesarticulos).distinct.order(:created_at).limit(5)
  end

  def imagenprincipal
    self.imagenesarticulos.first
  end

  def articleselected
    self.articles.order(:price).take
  end

  def self.search(search,page)
    wildcard_search = "%#{search}%"
    joins(:marca).where("products.name LIKE ? or products.specifications LIKE ? or marcas.name LIKE ?", wildcard_search, wildcard_search, wildcard_search)
  end


  def tiendas
    Tienda.joins(:articles).where(articles: {product_id: self.id})

  end



end
