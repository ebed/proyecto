class ChangeIdDeliveryCompany < ActiveRecord::Migration[5.0]
  def up
  	add_column :preciosdeliveries, :delivery_company_id , :integer
  	remove_column :preciosdeliveries, :deliveryCompany_id
  end
  def down
  	remove_column :preciosdeliveries, :delivery_company_id 
  	add_column :preciosdeliveries, :deliveryCompany_id, :integer
  end
end
