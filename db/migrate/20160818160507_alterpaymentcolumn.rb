class Alterpaymentcolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :method_id
    add_column :payments, :paymentmethod_id, :integer
  end
end
