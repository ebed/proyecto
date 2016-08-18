class Tienda < ApplicationRecord
  belongs_to :seller

  has_many :contacts, foreign_key: "owner_id",:dependent => :delete_all
  has_many :sells,:dependent => :delete_all
  has_many :articles,:dependent => :delete_all
end
