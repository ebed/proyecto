class AddEspecificacionesProducto < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :specifications, :text
    add_column :products, :year, :integer
  end
end
