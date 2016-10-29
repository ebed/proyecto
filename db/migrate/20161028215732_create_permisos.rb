class CreatePermisos < ActiveRecord::Migration[5.0]
  def change
    create_table :permisos do |t|
      t.integer :user_id
      t.integer :tienda_id
      t.boolean :canadmin

      t.timestamps
    end
  end
end
