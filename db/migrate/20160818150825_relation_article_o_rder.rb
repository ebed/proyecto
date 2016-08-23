class RelationArticleORder < ActiveRecord::Migration[5.0]
  def change
    add_column :selectedarticles, :order_id, :integer
  end
end
