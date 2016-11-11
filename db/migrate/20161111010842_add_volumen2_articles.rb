class AddVolumen2Articles < ActiveRecord::Migration[5.0]
  def up
  	add_column :articles, :altura, :float
  	add_column :articles, :anchura, :float
  	add_column :articles, :profundidad, :float
  	add_column :articles, :peso, :float
  end
  
  def down
  	remove_column :articles, :altura, :float
  	remove_column :articles, :anchura, :float
  	remove_column :articles, :profundidad, :float
  	remove_column :articles, :peso, :float
  end
end
