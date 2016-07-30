class Marca < ApplicationRecord
  has_many :products, :dependent => :delete_all
end
