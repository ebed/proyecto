class AddOrderToScoreTienda < ActiveRecord::Migration[5.0]
  def change
	add_column :score_tiendas, :order_id, :integer
  end
end
