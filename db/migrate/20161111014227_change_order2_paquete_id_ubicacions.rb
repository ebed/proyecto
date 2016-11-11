class ChangeOrder2PaqueteIdUbicacions < ActiveRecord::Migration[5.0]
  def up
  	add_column :ubicacions, :paquete_id, :integer
  	remove_column :ubicacions, :order_id
  end
  
  def down
  	add_column :ubicacions, :order_id, :integer
  	remove_column :ubicacions, :paquete_id
  end
end
