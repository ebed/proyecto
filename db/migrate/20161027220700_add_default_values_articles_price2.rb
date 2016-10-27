class AddDefaultValuesArticlesPrice2 < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :price_buy, :float, :default => 0
  end
end
