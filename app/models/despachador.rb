class Despachador < ApplicationRecord
  has_many :despachos, :dependent => :delete_all
  belongs_to :user
end
