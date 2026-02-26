require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module TaskManagementAPI
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end

    config.api_only = true
  end
end