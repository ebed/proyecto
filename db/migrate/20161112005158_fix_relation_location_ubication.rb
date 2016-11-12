class FixRelationLocationUbication < ActiveRecord::Migration[5.0]
  def up
  	remove_column :ubicacions, :location_id
	add_column :locations, :ubication_id, :integer
  end
  def down
	add_column :ubicacions, :location_id, :integer
	remove_column :locations, :ubication_id
  end	
end
