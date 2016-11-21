class CreateAddresses < ActiveRecord::Migration[5.0]
  def up
    create_table :addresses do |t|
      t.string :calle
      t.string :numero
      t.string :detalle
      t.string :comuna
      t.string :ciudad
      t.string :pais
      t.string :location_id

      t.timestamps
    end
    add_column :users, :adress_id, :integer
    add_column :bodegas, :address_id, :integer
    
  end
  
  
  def down
  	drop_table :addresses
    	remove_column :users, :adress_id 
    	remove_column :bodegas, :address_id 
  end
end
