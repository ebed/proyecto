class RelacionaUbicacionLocation < ActiveRecord::Migration[5.0]
  def up
  	remove_column :ubicacions, :latitud
  	remove_column :ubicacions, :longitud
  end
    def down
  	add_column :ubicacions, :longitud, :string
  	add_column :ubicacions, :latitud, :string
  	
  end
end
