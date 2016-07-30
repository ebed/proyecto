class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :contactype_id
      t.string :value

      t.timestamps
    end
  end
end
