class ImagenesArticulo < ApplicationRecord
  belongs_to :article


 has_attached_file :imagen,
                     styles: {
                      thumb: '100x100>',
                      square: '200x200#',
                      medium: '300x300>',
                      big: '700x700>'
                    }, default_url: "/images/:style/missing.png"

  do_not_validate_attachment_file_type :imagen
end
