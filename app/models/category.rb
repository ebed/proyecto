class Category < ApplicationRecord

  has_many :hijos, class_name: "Category",
                  foreign_key: "category_id",  :dependent => :delete_all

  belongs_to :padre, class_name: "Category"
  has_many :products, :dependent => :delete_all

end
