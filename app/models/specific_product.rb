class SpecificProduct < ApplicationRecord
  belongs_to :tienda
  belongs_to :product
  belongs_to :color
  belongs_to :talla

end
