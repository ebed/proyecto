class Addchangesprofile < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_id, :integer
    add_column :profiles, :canadmin, :boolean
    add_column :profiles, :cansell, :boolean
    add_column :profiles, :canadminstore, :boolean
    add_column :profiles, :canbuy, :boolean
  end
end
