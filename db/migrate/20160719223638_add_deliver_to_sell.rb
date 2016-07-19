class AddDeliverToSell < ActiveRecord::Migration[5.0]
  def change
    add_column :sells, :deliver_id, :integer
  end
end
