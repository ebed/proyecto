class RemoveUbicationfromLocation < ActiveRecord::Migration[5.0]
  def up
  	remove_column :locations, :ubicacion_id
  end
  def down
  	add_column :locations, :ubicacion_id, :integer
  end
end
