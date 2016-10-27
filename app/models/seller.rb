class Seller < ApplicationRecord

  has_many :tiendas, :dependent=> :delete_all

  belongs_to :user

  def orders
    Order.joins(selectedarticles: [{article: :tienda }]).where(tiendas: {seller_id: self.id})
  end

  def totalarticulos
    total =0
    self.tiendas.each do |tienda|
      total = total +tienda.articles.count
    end
    return total

  end

end
