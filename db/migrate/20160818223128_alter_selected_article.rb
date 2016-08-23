class AlterSelectedArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :selectedarticles, :inorder,:boolean
  end
end
