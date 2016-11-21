class CorrectNamesAddress < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :adress_id
  	add_column :users, :address_id, :integer
  	
  end
end
