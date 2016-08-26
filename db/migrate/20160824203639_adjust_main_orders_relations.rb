class AdjustMainOrdersRelations < ActiveRecord::Migration[5.0]
  def change
	add_column :main_orders, :user_id, :integer
	add_column :main_orders, :statusorder_id, :integer
	remove_column :sells, :tienda_id
  end
end
