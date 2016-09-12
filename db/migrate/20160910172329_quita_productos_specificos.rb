class QuitaProductosSpecificos < ActiveRecord::Migration[5.0]
  def change
	drop_table :specific_products
	add_column :articles, :color_id, :integer
	add_column :articles, :talla_id, :integer
	add_column :articles, :segmento_id, :integer
	add_column :articles, :sexo, :string
  end
end
