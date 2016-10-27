class Marca < ApplicationRecord
  has_many :products, :dependent => :delete_all

  has_attached_file :logo,
                     styles: {
                      thumb: '100x100>',
                      square: '200x200#',
                      medium: '300x300>',
                      big: '700x700>'
                    }

  do_not_validate_attachment_file_type :logo

end
