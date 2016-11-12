class CreatePaquetes < ActiveRecord::Migration[5.0]
  def change
    create_table :paquetes do |t|
      t.integer :estado_id
      t.integer :bodega_id
      t.integer :despacho_id
      t.timestamps
    end
  end
end
