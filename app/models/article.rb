class Article < ApplicationRecord
  belongs_to :product
  belongs_to :tienda

  has_many :sells, :dependent => :delete_all
  has_many :selectedarticles, :dependent => :delete_all


  def nombre
     self.product.name
  end

  def self.articulo(product_id, talla, color, tienda_id, sexo)
    articulos = Article.where(:product_id => product_id, :tienda_id => tienda_id)
    if talla.present?
      articulos.where(:talla => talla)
    end

    if color.present?
      articulos.where(:color => color)
    end

    if sexo.present?
      articulos.where(:sexo => sexo)
    end
    return articulos.first

  end

end
