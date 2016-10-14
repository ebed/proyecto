class AddCommentToScoreProduct < ActiveRecord::Migration[5.0]
  def change
	add_column :scores, :comment, :string
  end
end
