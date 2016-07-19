class Sell < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  belongs_to :article
  has_many :delivers
  has_one :payment
end
