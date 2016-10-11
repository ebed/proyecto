class RemoveLogoBrandTienda < ActiveRecord::Migration[5.0]
  def change
	remove_attachment :tiendas, :imagenBrand
  end
end
