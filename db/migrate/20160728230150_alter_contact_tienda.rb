class AlterContactTienda < ActiveRecord::Migration[5.0]
  def change
    remove_column :tiendas, :contact_id
    add_column :contacts, :owner_id, :integer
  end
end
