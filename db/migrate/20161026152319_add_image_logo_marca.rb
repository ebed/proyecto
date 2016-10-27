class AddImageLogoMarca < ActiveRecord::Migration[5.0]
  def up
    add_attachment :marcas, :logo
  end

  def down
    remove_attachment :marcas, :logo
  end
end
