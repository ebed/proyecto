class AddValorTotalPayment < ActiveRecord::Migration[5.0]
  def up
  	add_column :payments, :total, :float
  end
  
   def down
  	remove_column :payments, :total 
  end
end
