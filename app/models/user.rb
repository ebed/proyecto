class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, :dependent => :delete_all
  has_many :scores, :dependent => :delete_all
  has_one :seller, :dependent => :destroy
  has_many :sells, :dependent => :delete_all
  has_many :main_orders, :dependent => :delete_all
  has_many :selectedarticles, :dependent => :delete_all
  has_one :contact, :dependent => :destroy
  belongs_to :profile



  def name
     self.nombre
  end

  def isSeller?
    Seller.where(user_id: self.id).count > 0
  end

  def articulosSeleccionados
    arts=0;
    Selectedarticle.where(:user_id => self.id).each do |art|
      if (art.qty.present? and !art.order_id.present?)
        arts=arts+art.qty
      end
    end
    return arts
  end


  def destroyCarro
    Selectedarticle.where(:user_id => self.id ).destroy_all
  end

  def totalPagar
    carro = Selectedarticle.where(user_id: self.id)
    total = 0
    carro.each do |item|
      if item.present? and item.article.present? and item.article.price.present? and item.qty.present?  and !item.order_id.present?

        total = total + (item.article.price * item.qty)
      end
    end
    return total
  end

  def tieneOrden?

    self.selectedarticles.present? && self.selectedarticles.first.order_id != nil && self.selectedarticles.first.order_id > 0
  end

  def orden
    self.selectedarticles.first.order.main_order
  end

  def totalxtienda
    resultado = []
    Tienda.joins(articles: :selectedarticles).where(selectedarticles: {user_id: self.id}).each do |tienda|
      total = 0
      Selectedarticle.joins(:article).where(user_id: 1, articles: {tienda_id: tienda.id}).each do |sart|
        total = total + sart.qty = sart.article.price

      end
      item = {tienda: tienda.id, total: total}
      resultado << item
    end
    return resultado

  end
end
