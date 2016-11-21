class Bodega < ApplicationRecord
  has_many :paquetes, :dependent => :delete_all
  belongs_to :tienda
  belongs_to :address
  has_many :stocks, :dependent => :delete_all



  def self.origenDespacho

    Bodega.first

  end

end
