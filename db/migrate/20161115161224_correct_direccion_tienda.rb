class CorrectDireccionTienda < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tiendas, :direccion
  	remove_column :tiendas, :location_id
  	
  	
  	add_column :tiendas, :address_id, :integer
  end
end
