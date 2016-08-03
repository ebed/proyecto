class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end

    remove_column :products, :category_id
    add_column :products, :subcategory_id, :integer
  end
end
