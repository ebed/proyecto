class Payment < ApplicationRecord
  belongs_to :main_order
  belongs_to :paymentmethods
end
