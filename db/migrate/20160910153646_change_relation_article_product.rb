class ChangeRelationArticleProduct < ActiveRecord::Migration[5.0]
  def change
	add_column :articles, :specificproduct_id, :integer
  end
end
