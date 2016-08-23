class Payment < ApplicationRecord
  belongs_to :sell
  belongs_to :paymentmethods
end
