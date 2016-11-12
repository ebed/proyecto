class Bodega < ApplicationRecord
  has_many :paquetes, :dependent => :delete_all
  belongs_to :tienda
end
