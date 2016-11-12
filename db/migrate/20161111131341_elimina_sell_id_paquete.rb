class EliminaSellIdPaquete < ActiveRecord::Migration[5.0]
  def up
  	remove_column :paquetes, :sell_id
  end
  
   def down
  	add_column :paquetes, :sell_id, :integer
  end
end
