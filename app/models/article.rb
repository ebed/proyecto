class Article < ApplicationRecord
  belongs_to :product
  belongs_to :seller
  has_many :sells



  def nombre
     self.product.name
  end
end
