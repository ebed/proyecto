class Estadoitemdespacho < ApplicationRecord
  has_many :sells, :dependent => :delete_all




end
