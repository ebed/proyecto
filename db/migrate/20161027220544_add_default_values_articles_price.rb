class AddDefaultValuesArticlesPrice < ActiveRecord::Migration[5.0]
  def change
  	remove_column :articles, :price_buy
  	  end
end
