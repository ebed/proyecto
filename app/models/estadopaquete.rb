class Estadopaquete < ApplicationRecord
  has_many :paquetes,  foreign_key:  "estado_id", :dependent => :delete_all
end
