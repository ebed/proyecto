class CreateScoreTiendas < ActiveRecord::Migration[5.0]
  def change
    create_table :score_tiendas do |t|
      t.integer :score
      t.integer :user_id
      t.integer :tienda_id
      t.string :comentario

      t.timestamps
    end
  end
end
