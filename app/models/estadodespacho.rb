class Estadodespacho < ApplicationRecord
  has_many :despachos,:foreign_key => "estado_id" , :dependent => :delete_all
end
