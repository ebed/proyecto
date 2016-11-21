class ChangeRelationLocationAddress < ActiveRecord::Migration[5.0]
  def up
  	add_column :locations, :address_id, :integer
  	remove_column :addresses, :location_id 
  end
  def down
   	remove_column :locations, :address_id
  	add_column :addresses, :location_id, :integer
  end
end
