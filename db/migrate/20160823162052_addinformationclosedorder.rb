class Addinformationclosedorder < ActiveRecord::Migration[5.0]
  def change
	add_column :statusorders, :open, :boolean
  end
end
