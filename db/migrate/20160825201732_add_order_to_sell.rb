class AddOrderToSell < ActiveRecord::Migration[5.0]
  def change
	add_column :sells, :order_id, :integer
	add_column :sells, :precio_venta, :integer
	add_column :sells, :cantidad, :integer
  end
end
