class Addcolumns4dragonfly < ActiveRecord::Migration[5.0]
  def change
    add_column :imagenesarticulos, :image_uid,  :string
    add_column :imagenesarticulos, :image_name, :string  # Optional - if you want urls
                                          # to end with the original filename
  end
end
