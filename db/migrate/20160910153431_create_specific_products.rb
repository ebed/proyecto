class CreateSpecificProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :specific_products do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :talla_id
      t.string :sexo
      t.integer :segmento_id

      t.timestamps
    end
  end
end
