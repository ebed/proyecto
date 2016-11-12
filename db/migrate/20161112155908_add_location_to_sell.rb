class AddLocationToSell < ActiveRecord::Migration[5.0]
  def up
  	add_column :tiendas, :direccion, :string
  	add_column :tiendas, :location_id, :integer
   end
   
   def down
  	remove_column :tiendas, :direccion 
  	remove_column :tiendas, :location_id 
   end
end
