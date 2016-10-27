class Order < ApplicationRecord
  has_many :selectedarticles, :dependent => :destroy
  has_one :sell, :dependent => :destroy

  belongs_to :main_order
  belongs_to :tienda

  def comprador
   self.selectedarticles.first.user
  end

end
