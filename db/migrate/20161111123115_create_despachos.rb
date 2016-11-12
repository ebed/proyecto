class CreateDespachos < ActiveRecord::Migration[5.0]
  def change
    create_table :despachos do |t|
      t.integer :estado_id
      t.integer :despachador_id

      t.timestamps
    end
  end
end
