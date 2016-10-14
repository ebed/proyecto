class CreateBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :banners do |t|
      t.string :descripcion
      t.integer :articulo_id

      t.timestamps
    end
  end
end
