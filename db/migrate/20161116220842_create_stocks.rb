class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :bodega_id
      t.integer :article_id
      t.integer :stock

      t.timestamps
    end
  end
end
