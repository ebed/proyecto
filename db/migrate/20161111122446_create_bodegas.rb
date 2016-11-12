class CreateBodegas < ActiveRecord::Migration[5.0]
  def change
    create_table :bodegas do |t|
      t.string :direccion
      t.integer :tienda_id

      t.timestamps
    end
  end
end
