class User < ApplicationRecord
  has_many :comments
  has_many :scores
  has_one :seller

  def name
     self.nombre
  end

  def isSeller?
    Seller.where(user_id: self.id).count > 0
  end
end
