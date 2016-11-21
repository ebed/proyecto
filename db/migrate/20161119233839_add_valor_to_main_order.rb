class AddValorToMainOrder < ActiveRecord::Migration[5.0]
  def up
  	add_column :main_orders, :valordespacho, :integer
  	add_column :main_orders, :valortotal, :integer
  	
  end
  def down
  	remove_column :main_orders, :valordespacho
  	remove_column :main_orders, :valortotal
  	
  end
end
