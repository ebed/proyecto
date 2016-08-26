class MainOrder < ApplicationRecord
  has_many :orders,:dependent => :delete_all
  has_one :deliver, :dependent => :delete
  belongs_to :user
  belongs_to :statusorder


  def total
    totalMainOrder=0
    Order.where(:main_order_id => self.id).each do |ord|
      if ord.selectedarticles.present?
        ord.selectedarticles.each do |sart|
          totaltemp = sart.article.price * sart.qty
          totalMainOrder = totalMainOrder + totaltemp
        end
      else
        if ord.sell.present?
          totaltemp = ord.sell.precio_venta * ord.sell.cantidad
          totalMainOrder = totalMainOrder + totaltemp
        end
      end

    end
    return totalMainOrder
  end


  def fechacambio
    Order.where(:main_order_id => self.id).maximum(:fechacambio)

  end

end
