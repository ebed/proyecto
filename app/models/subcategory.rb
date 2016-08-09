class Subcategory < ApplicationRecord
  belongs_to :category
 has_many :products, :dependent => :delete_all
  def self.optionsForSelect
    Subcategory.all.collect {|p| [ p.name, p.id ] }
  end
end
