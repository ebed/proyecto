class AddLogoTienda < ActiveRecord::Migration[5.0]
  def up
    add_attachment :tiendas, :imagen
  end

  def down
    remove_attachment :tiendas, :imagen
  end
end
