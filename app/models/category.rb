class Category < ApplicationRecord

  has_many :subcategories,  :dependent => :delete_all




  def self.optionsForSelect
    Category.where(:category_id => nil).order(:name).collect {|p| [ p.name, p.id ] }
  end

  self.per_page = 10


  def self.cantidadColumnas
    predefinidas=5
    total = Category.all.order(:name).count+5
    cien = 100.to_f
    return cien/total
  end
end
