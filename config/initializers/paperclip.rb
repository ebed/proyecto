# config/initializers/paperclip.rb
#Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
#Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
if Rails.env.production?
  # See http://rubydoc.info/gems/paperclip/Paperclip/Storage/S3
  Paperclip.options[:image_magick_path] = "/usr/bin/"

  Paperclip::Attachment.default_options.merge!({
    storage: :s3,
    :url => ":s3_domain_url",
    :path => '/:class/:attachment/:id_partition/:style/:filename',
    s3_region: ENV['AWS_REGION'],
    s3_credentials: {
      bucket: ENV['S3_BUCKET_NAME'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      :s3_host_name => 's3.amazonaws.com'
    }
  })
end

# Config for Non-production Environments
unless Rails.env.production?
  Paperclip::Attachment.default_options.merge!({
    :url => "/system/:rails_env/:class/:attachment/:id_partition/:style/:filename",
    :path => ":rails_root/public:url"
  })
end



