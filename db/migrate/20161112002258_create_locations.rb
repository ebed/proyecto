class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :longitud
      t.string :latitud

      t.timestamps
    end
  end
end
