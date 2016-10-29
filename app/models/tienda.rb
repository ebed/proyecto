class Tienda < ApplicationRecord

  belongs_to :seller

  has_many :contacts, foreign_key: "owner_id",:dependent => :delete_all

  has_many :articles,:dependent => :delete_all
  has_many :orders, :dependent => :delete_all
  has_many :specific_product
  has_many :score_tiendas, :dependent=> :delete_all
  has_many :permisos, :dependent => :destroy

  accepts_nested_attributes_for :contacts

  has_attached_file :imagen,
                     styles: {
                      thumb: '100x100>',
                      square: '200x200#',
                      medium: '300x300>',
                      big: '700x700>'
                    }, default_url: "/images/:style/missing.png"

  do_not_validate_attachment_file_type :imagen


  def contarordenespendientes

    Order.joins(main_order: :statusorder).where(:tienda_id => self.id,statusorders: {:pending => true}).count

  end


  def cantidadArticulos
    self.articles.select(:product_id).distinct.count
  end

  def stockTotal
    resultado = 0
    self.articles.each do |articulo|
      resultado = resultado + articulo.stock
    end
    return resultado
  end


  def totalVentas
    total = 0
    ventas = Sell.joins(order: :main_order).where(orders: {tienda_id: self.id }, main_orders: {statusorder_id: 6})
    ventas.each do |venta|
      total = venta.cantidad
    end
    return total
  end


  def artMasVendido
    resultado = self.ventas.first
    if resultado.present?
      Article.find(resultado[:article_id])
    end
  end

   def artMenosVendido
    resultado = self.ventas.last
    if resultado.present?
      Article.find(resultado[:article_id])
    end
  end

   def ventas
    resultado = Sell.select("article_id, sum(cantidad) as cantidad").joins(order: :main_order).where(orders: {tienda_id: self.id}, main_orders: {statusorder_id: 6}).group(:article_id).order(:cantidad)
  end

  def sinVentas

    arts= Sell.joins(article: :product, order: :main_order).where(orders: {tienda_id: self.id}, main_orders: {statusorder_id: 6}).group(:product_id).pluck(:product_id)

    p arts
    Article.where.not(:product_id => arts)
  end

  def artMenorStock
    Article.joins(:tienda).where(tiendas: {id: self.id}).order(:stock).first
  end
end











