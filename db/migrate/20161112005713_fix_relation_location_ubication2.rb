class FixRelationLocationUbication2 < ActiveRecord::Migration[5.0]
  def up
  	remove_column :locations, :ubication_id
  	add_column :locations, :ubicacion_id, :integer
  end
  def down
  	remove_column :locations, :ubicacion_id
  	add_column :locations, :ubication_id, :integer
  end
end
