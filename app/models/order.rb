class Order < ApplicationRecord
  has_many :selectedarticles, :dependent => :delete_all
  has_one :sell, :dependent => :delete

  belongs_to :main_order
  belongs_to :tienda

  def comprador
   self.selectedarticles.first.user
  end

end
