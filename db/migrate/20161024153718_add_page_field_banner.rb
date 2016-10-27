class AddPageFieldBanner < ActiveRecord::Migration[5.0]
  def change
  	add_column :banners, :pagina, :string
  end
end
