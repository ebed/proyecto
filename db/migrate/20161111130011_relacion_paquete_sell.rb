class RelacionPaqueteSell < ActiveRecord::Migration[5.0]
  def up
  	add_column :sells, :paquete_id, :integer
  	 
  end
  
  def down
  	remove_column :sells, :paquete_id
  	
  end
end
