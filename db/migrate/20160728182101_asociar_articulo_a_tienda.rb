class AsociarArticuloATienda < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :seller_id
    add_column :articles, :tienda_id, :integer
  end
end
