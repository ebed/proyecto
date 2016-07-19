class CreateDelivers < ActiveRecord::Migration[5.0]
  def change
    create_table :delivers do |t|
      t.integer :status_id
      t.string :location
      t.string :haveIt

      t.timestamps
    end
  end
end
