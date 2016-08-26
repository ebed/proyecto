class AlterIdMainOrderInOrder < ActiveRecord::Migration[5.0]
  def change
	remove_column :orders, :mainorder_id
	add_column :orders, :main_order_id, :integer
  end
end
