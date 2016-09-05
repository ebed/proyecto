# config/initializers/paperclip.rb
#Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = './images/:class/:attachment/:id_partition/:style/:filename'

