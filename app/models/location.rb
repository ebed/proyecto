class Location < ApplicationRecord
    belongs_to :ubicacion
    has_one :tienda
    has_one :direcion
end
