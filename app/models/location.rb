class Location < ApplicationRecord
    has_one :despacho, :dependent => :destroy
    has_one :tienda
    has_one :direcion
end
