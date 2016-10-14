class AddImageBanners < ActiveRecord::Migration[5.0]
  def up
    add_attachment :banners, :imagen
  end

  def down
    remove_attachment :banners, :imagen
  end
end
