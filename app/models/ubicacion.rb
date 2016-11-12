class Ubicacion < ApplicationRecord
  has_one :location, :dependent => :destroy

end
