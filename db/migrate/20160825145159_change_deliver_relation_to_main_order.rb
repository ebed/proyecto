class ChangeDeliverRelationToMainOrder < ActiveRecord::Migration[5.0]
  def change
	remove_column :delivers, :order_id
	add_column :delivers, :main_order_id,:integer
  end
end
