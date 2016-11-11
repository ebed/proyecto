class AddAttachmentImagenToImagenesArticulos < ActiveRecord::Migration
  def self.up
    change_table :imagenes_articulos do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :imagenes_articulos, :imagen
  end
end
