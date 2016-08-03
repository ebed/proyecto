class Article < ApplicationRecord
  belongs_to :product
  belongs_to :tienda

  has_many :sells, :dependent => :delete_all
  has_many :selectedarticles, :dependent => :delete_all


  def nombre
     self.product.name
  end
end
