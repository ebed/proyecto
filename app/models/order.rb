class Order < ApplicationRecord
  has_many :selectedarticles, :dependent => :delete_all
  has_one :deliver, :dependent => :delete
  belongs_to :statusorder
  belongs_to :user

  def comprador
   self.selectedarticles.first.user
  end

end
