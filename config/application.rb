require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Skeleton
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', 
          :headers => :any, 
          :expose => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          :methods => [:get, :post, :patch, :delete, :options]
      end
      end
    config.i18n.default_locale = :en
    config.active_job.queue_adapter = :inline
  end
end
