class Article < ApplicationRecord
  belongs_to :product
  belongs_to :tienda

  has_many :stocks, :dependent => :delete_all

  has_many :sells, :dependent => :delete_all
  has_many :selectedarticles, :dependent => :delete_all

  has_many :imagenes_articulos, :dependent => :delete_all


  def nombre
     self.product.name
  end

  def textoaqr
     texto = self.id.to_s+";"+self.nombre + ";"+self.product.marca.name+";"+self.tienda.id.to_s+";"+self.tienda.name

     textoEnc = Digest::MD5.hexdigest( texto )
     return RQRCode::QRCode.new( texto, :size => 6, :level => :h )
  end

  def bodegaEscogida
    stocks = Stock.where(:article_id => self.id)
    maximo = 0
    resultado = Bodega.new
    stocks.each do |stock|
      if maximo == 0 or stock.stock >= maximo
        maximo = stock.stock
        resultado = stock.bodega
      end

    end
    return resultado

  end


  def totalstock
    Stock.where(:article_id => self.id).sum(:stock)
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

  def porcentajeganancia
    if self.price_buy.present?
      ((self.price - self.price_buy) / self.price_buy ) * 100
    else
      0
    end
  end

  def gananciaesperada
    if self.price_buy.present?
       (self.price - self.price_buy) * self.stock
    else
      0
    end

  end
end
