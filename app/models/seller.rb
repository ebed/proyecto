class Seller < ApplicationRecord
  has_many :articles
  belongs_to :user



end
