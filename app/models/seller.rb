class Seller < ApplicationRecord
  has_many :articles, :dependent => :delete_all

  has_many :tiendas, :dependent=> :delete_all

  belongs_to :user



end
