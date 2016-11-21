class Paquete < ApplicationRecord
  belongs_to :estadopaquete,foreign_key:  "estado_id"
  belongs_to :despacho
  belongs_to :bodega
  has_many :sells
end
