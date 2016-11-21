class DeliveryCompany < ApplicationRecord
  belongs_to :address
  has_one :payment

  has_many :preciosdelivery, :dependent => :delete_all
end
