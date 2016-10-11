class AddAttachmentImagenbrandToTiendas < ActiveRecord::Migration
  def self.up
    change_table :tiendas do |t|
      t.attachment :imagenBrand
    end
  end

  def self.down
    remove_attachment :tiendas, :imagenBrand
  end
end
