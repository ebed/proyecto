class CreateSelectedarticles < ActiveRecord::Migration[5.0]
  def change
    create_table :selectedarticles do |t|
      t.integer :article_id
      t.integer :qty
      t.integer :user_id

      t.timestamps
    end
  end
end
