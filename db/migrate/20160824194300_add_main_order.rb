class AddMainOrder < ActiveRecord::Migration[5.0]
  def change
	add_column :orders, :mainorder_id, :integer
  end
end
