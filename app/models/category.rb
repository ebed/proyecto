class Category < ApplicationRecord

  has_many :hijos, class_name: "Category",
                  foreign_key: "category_id"

  belongs_to :padre, class_name: "Category"
  has_many :products

end
