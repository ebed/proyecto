class MainOrder < ApplicationRecord
  has_many :orders,:dependent => :destroy
  has_one :deliver, :dependent => :destroy
  belongs_to :user
  belongs_to :statusorder

  belongs_to :payment



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

  def bodegas

     Bodega.joins(tienda: :orders).where(orders: {:main_order_id => self.id}).pluck(:id)
            #bodegas = Bodega.first.tienda.orders.where(:main_order => self.id).pluck(:id)

  end

end
