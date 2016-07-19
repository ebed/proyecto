class ChangeDeliverToSell < ActiveRecord::Migration[5.0]
  def change
    remove_column :sells, :deliver_id
    add_column :delivers, :sell_id, :integer
  end
end
