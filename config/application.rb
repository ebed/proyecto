require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Proyecto
  class Application < Rails::Application

    GoogleDistanceMatrix.configure_defaults do |config|
      config.use_encoded_polylines = true
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)

    config.assets.initialize_on_precompile = false
#    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/lib/classes)
    #config.assets.precompile += Ckeditor.assets

    config.assets.precompile += %w( ckeditor/* )
    #config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff|woff2|otf)$)
  end
end
