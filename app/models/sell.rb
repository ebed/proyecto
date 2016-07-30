class Sell < ApplicationRecord
  belongs_to :user
  belongs_to :tienda
  belongs_to :article
  has_many :delivers, :dependent => :delete_all
  has_one :payment, :dependent => :destroy
end
