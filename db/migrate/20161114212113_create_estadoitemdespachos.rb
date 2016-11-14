class CreateEstadoitemdespachos < ActiveRecord::Migration[5.0]
  def up
    create_table :estadoitemdespachos do |t|
      t.string :estado
	
      t.timestamps
    end
    add_column :sells, :estadoitemdespacho_id, :integer
  end
  
  def down
  	drop_table :estadoitemdespachos
  end
end
