class Banner < ApplicationRecord

  has_one :article

  has_attached_file :imagen, styles: { medium: "870x200>", thumb: "100x100>" }
  validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/
end
