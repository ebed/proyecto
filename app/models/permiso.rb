class Permiso < ApplicationRecord
  belongs_to :user
  belongs_to :tienda
end
