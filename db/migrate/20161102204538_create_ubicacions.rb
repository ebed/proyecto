class CreateUbicacions < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicacions do |t|
      t.string :longitud
      t.string :latitud
      t.integer :order_id
      t.integer :despachador_id

      t.timestamps
    end
  end
end
