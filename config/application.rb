# frozen_string_literal: true

require_relative 'boot'

require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookstore
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Prevents assets generation
    config.generators.stylesheets = false
    config.generators.javascripts = false

    # RSpec config
    config.generators do |g|
      g.test_framework :rspec, request_specs: false, helper_specs: false, controller_specs: true, feature_specs: true
    end

    # Changes factory bot path
    # config.factory_bot.definition_file_paths = ["spec/support/factories"]
  end
end
