class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.string :description
      t.string :image
      t.integer :product_id
      t.string :image_file_name
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
