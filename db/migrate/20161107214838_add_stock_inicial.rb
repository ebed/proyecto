class AddStockInicial < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :stock_inicial, :integer, :default => 0
  end
end
