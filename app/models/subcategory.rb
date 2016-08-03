class Subcategory < ApplicationRecord
  belongs_to :category

  def self.optionsForSelect
    Subcategory.all.collect {|p| [ p.name, p.id ] }
  end
end
