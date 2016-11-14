class ChangeRelationLocationDespachos < ActiveRecord::Migration[5.0]
  def up
  	add_column :despachos, :location_id, :integer
  end
  def down
  	remove_column :despachos, :location_id
  end
end
