class AddStatus2Seller < ActiveRecord::Migration[5.0]
  def change
  	add_column :sellers, :habilitado, :boolean
  end
end
