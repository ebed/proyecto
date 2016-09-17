class AddDatosUsuarios < ActiveRecord::Migration[5.0]
  def change
        add_column :users, :apellidos, :string
    add_column :users, :contact_id, :string
  end
end
