class AlterComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :article_id
    add_column :comments, :product_id, :integer
  end
end
