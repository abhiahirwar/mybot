require_relative 'boot'

require 'rails/all'
require 'bittrex'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mybot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    config.time_zone = 'Melbourne'
    config.active_record.default_timezone = :local # Or :utc
 
    Bittrex.config do |c|
      c.key = Rails.application.credentials.bittrex_api_key
      c.secret = Rails.application.credentials.bittrex_api_secret
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
