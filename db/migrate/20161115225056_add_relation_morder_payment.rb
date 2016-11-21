class AddRelationMorderPayment < ActiveRecord::Migration[5.0]
  def up
  	add_column :main_orders, :payment_id, :integer
  	remove_column :main_orders, :total
  	remove_column :sells, :payment_id
  	
  end
    def down
  	remove_column :main_orders, :payment_id
  	add_column :main_orders, :total, :integer
  	add_column :sells, :payment_id, :integer
  	
  end
end
