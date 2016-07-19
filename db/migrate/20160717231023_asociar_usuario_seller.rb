class AsociarUsuarioSeller < ActiveRecord::Migration[5.0]
  def change
    add_reference :sellers, :users, index: true
  end
end
