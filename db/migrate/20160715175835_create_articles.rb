class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.float :price
      t.integer :product_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
