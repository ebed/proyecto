class AddPrecioToPreciodelivery < ActiveRecord::Migration[5.0]
  def up
  	add_column :preciosdeliveries, :precio, :integer
  end
  def down
  	remove_column :preciosdeliveries, :precio
  end
end
