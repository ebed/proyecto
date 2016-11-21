class Location < ApplicationRecord
    has_one :despacho, :dependent => :destroy
    has_one :tienda
    belongs_to :address

end
