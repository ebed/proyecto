class CreateDeliveryCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_companies do |t|
      t.string :nombre
      t.integer :address_id
      t.string :telefono

      t.timestamps
    end
  end
end
