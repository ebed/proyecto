class CreateTiendas < ActiveRecord::Migration[5.0]
  def change
    create_table :tiendas do |t|
      t.string :name
      t.integer :contac_id
      t.date :dob
      t.integer :seller_id

      t.timestamps
    end
  end
end
