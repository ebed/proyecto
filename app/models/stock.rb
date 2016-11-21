class Stock < ApplicationRecord
  belongs_to :bodega
  belongs_to :article

end
