class CreateSells < ActiveRecord::Migration[5.0]
  def change
    create_table :sells do |t|
      t.integer :user_id
      t.integer :seller_id
      t.integer :article_id
      t.integer :evaluation
      t.text :comment
      t.integer :payment_id

      t.timestamps
    end
  end
end
