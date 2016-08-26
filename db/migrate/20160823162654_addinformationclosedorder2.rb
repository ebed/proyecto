class Addinformationclosedorder2 < ActiveRecord::Migration[5.0]
  def change
	remove_column :statusorders, :open
	add_column :statusorders, :pending, :boolean
  end
end
