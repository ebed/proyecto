class Addstockarticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :stock, :integer
  end
end
