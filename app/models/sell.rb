class Sell < ApplicationRecord
  belongs_to :user

  belongs_to :article

  belongs_to :order

  belongs_to :paquete

  belongs_to :estadoitemdespacho



  def nameproduct
    self.article.product.name
  end


  def idproduct
    self.article.id
  end

end
