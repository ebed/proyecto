class Sell < ApplicationRecord
  belongs_to :user

  belongs_to :article

  belongs_to :order


end
