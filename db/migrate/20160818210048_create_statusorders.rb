class CreateStatusorders < ActiveRecord::Migration[5.0]
  def change
    create_table :statusorders do |t|
      t.string :value

      t.timestamps
    end

    add_column :orders, :status_id, :integer
    add_column :orders, :fechacambio, :date
  end
end
