class Payment < ApplicationRecord
  belongs_to :main_order
  belongs_to :paymentmethods
  belongs_to :delivery_company
end
