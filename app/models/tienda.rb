class Tienda < ApplicationRecord
  belongs_to :seller

  has_many :contacts, foreign_key: "owner_id",:dependent => :delete_all
  has_many :sells,:dependent => :delete_all
  has_many :articles,:dependent => :delete_all
  has_many :orders, :dependent => :delete_all
  has_many :specific_product

  def contarordenespendientes

    Order.joins(main_order: :statusorder).where(:tienda_id => self.id,statusorders: {:pending => true}).count

  end
end











