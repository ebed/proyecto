class AddTienda2Sell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :tienda_id, :integer
    remove_column :sells, :seller_id
  end
end
