class Seller < ApplicationRecord

  has_many :tiendas, :dependent=> :delete_all

  belongs_to :user

  def orders
    Order.joins(selectedarticles: [{article: :tienda }]).where(tiendas: {seller_id: self.id})
  end


end
