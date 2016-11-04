class QuitaProductosAtributosArticulos < ActiveRecord::Migration[5.0]
  def change
	remove_column :articles, :color_id
	remove_column :articles, :talla_id
	remove_column :articles, :segmento_id

	add_column :articles, :color, :string
	add_column :articles, :talla, :string
	add_column :articles, :segmento, :string

	#drop_table :colors
	#drop_table :tallas
	#drop_table :segments

  end
end
