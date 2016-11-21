class AddRelationPaymentDelivery < ActiveRecord::Migration[5.0]
  def change
  	add_column :payments, :delivery_company_id, :integer
  end 
end
