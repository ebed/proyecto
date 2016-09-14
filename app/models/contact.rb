class Contact < ApplicationRecord
  belongs_to :tienda
  belongs_to :user
  belongs_to :contactype
end
