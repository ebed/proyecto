class ChangeUbicacion < ActiveRecord::Migration[5.0]
  def up
  	remove_column :ubicacions, :paquete_id
  	remove_column :ubicacions, :despachador_id
  	add_column :ubicacions, :despacho_id, :integer
  end
  
    def down
  	add_column :ubicacions, :paquete_id, :integer
  	add_column :ubicacions, :despachador_id, :integer
  	remove_column :ubicacions, :despacho_id, :integer
  end
end
