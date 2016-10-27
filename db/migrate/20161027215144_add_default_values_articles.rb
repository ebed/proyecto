class AddDefaultValuesArticles < ActiveRecord::Migration[5.0]
  def change
  	change_column :articles, :stock, :integer, :default => 0
  	change_column :articles, :price_buy, :float, :default => 0
  	change_column :articles, :price, :float, :default => 0
  end
end
