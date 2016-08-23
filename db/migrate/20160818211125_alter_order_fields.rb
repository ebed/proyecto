class AlterOrderFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :status_id
    add_column :orders, :statusorder_id, :integer
    add_column :statusorders, :predecesor_id, :integer
  end
end
