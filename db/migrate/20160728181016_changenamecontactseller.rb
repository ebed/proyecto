class Changenamecontactseller < ActiveRecord::Migration[5.0]
  def change
    rename_column :tiendas, :contac_id, :contact_id
  end
end
