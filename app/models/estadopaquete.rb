class Estadopaquete < ApplicationRecord
  has_many :paquetes, :dependent => :delete_all
end
