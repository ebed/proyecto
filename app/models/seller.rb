class Seller < ApplicationRecord

  has_many :tiendas, :dependent=> :delete_all

  belongs_to :user



end
