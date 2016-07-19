class AsociarUsuarioSeller2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :sellers, :users_id
    add_column :sellers, :user_id, :integer
  end
end
