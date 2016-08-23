class ChangeRelationSellDeliver < ActiveRecord::Migration[5.0]
  def change
	remove_column :delivers, :sell_id
	add_column :delivers, :order_id, :integer
  end
end
