class CreateEstadodespachos < ActiveRecord::Migration[5.0]
  def change
    create_table :estadodespachos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
