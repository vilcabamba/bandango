require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Rake
  class Task
    alias_method :origin_invoke, :invoke if method_defined?(:invoke)
    def invoke(*args)
      logger = Logger.new("log/rake.log")
      logger.info name
      origin_invoke(*args)
    end
  end
end

module Bandango
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "Quito"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # I18n locales (see more on http://stackoverflow.com/questions/20361428/rails-i18n-validation-deprecation-warning)
    I18n.config.enforce_available_locales = true
  end
end
