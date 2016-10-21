class AddFieldsBanners < ActiveRecord::Migration[5.0]
  def change
	add_column :banners, :tipobanner_id, :integer
	add_column :banners, :operativo, :boolean

  end
end
