class CreateDireccions < ActiveRecord::Migration[5.0]
  def up
     
  # add_column :users, :direccion_id, :integer
  end
  
  def down
  	drop_table :direccions
  	remove_column :users, :direccion_id
  end
end
