class Imagenesarticulo < ApplicationRecord

  belongs_to :product


  def initialize(params = {})

  file = params.delete(:file)
  p "EN initialize "
  p params
  p "mostrando file: "
  p file
  super
  if file
    p "Dentro del if"
    self.filename = sanitize_filename(file.original_filename)
    self.content_type = file.content_type
    self.file_contents = file.read
    p self
  end
end
private
  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    return File.basename(filename)
  end
end
