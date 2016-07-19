class Seller < ApplicationRecord
  has_many :articles
  has_many :sells
  belongs_to :user



end
