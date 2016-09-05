class ProductImage < ApplicationRecord
  belongs_to :product
  has_attached_file :image,
                     styles: {
                      thumb: '100x100>',
                      square: '200x200#',
                      medium: '300x300>',
                      big: '700x700>'
                    }

  do_not_validate_attachment_file_type :image
end




