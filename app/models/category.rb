class Category < ApplicationRecord

  has_many :subcategories,  :dependent => :delete_all

  belongs_to :padre, class_name: "Category"
  has_many :products, :dependent => :delete_all



  def self.optionsForSelect
    Category.where(:category_id => nil).order(:name).collect {|p| [ p.name, p.id ] }
  end

  self.per_page = 10

end
