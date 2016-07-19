class Article < ApplicationRecord
  belongs_to :product
  belongs_to :seller



  def nombre
     self.product.name
  end
end
