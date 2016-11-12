class Paquete < ApplicationRecord
  belongs_to :estadopaquetes
  belongs_to :despachos
  belongs_to :bodega
  has_many :sells
end
