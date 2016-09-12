class ChangeRelationTiendaProduct < ActiveRecord::Migration[5.0]
  def change
	add_column :specific_products, :tienda_id, :integer
  end
end
