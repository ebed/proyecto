class AddrelimagenProd < ActiveRecord::Migration[5.0]
  def change
    add_column :imagenesarticulos, :order, :integer
    add_column :imagenesarticulos, :product_id, :integer

  end
end
