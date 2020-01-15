require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SearchUmd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Since some of the Quick Search JavaScript files use Rails url_helpers,
    # the RAILS_RELATIVE_URL_ROOT setting needs to be configured
    relative_url_root = ENV['RAILS_RELATIVE_URL_ROOT'] || ''
    Rails.application.routes.default_url_options[:script_name] = relative_url_root
    QuickSearch::Engine.routes.default_url_options[:script_name] = relative_url_root
  end
end
