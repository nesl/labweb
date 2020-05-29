require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if File.exists?(File.expand_path('../application.local.yml', __FILE__))
  config = YAML.load(File.read(File.expand_path('../application.local.yml', __FILE__)))
  config.merge! config.fetch(Rails.env, {})
  config.each do |key, value|
    ENV[key] ||= value.to_s unless value.kind_of? Hash
  end
end

module Labweb
  RE_FIRSTNAME = /\A(([A-Z][a-z]*)(( |-)([A-Za-z][a-z]*))*)?\z/
  RE_LASTNAME = /\A((([a-z]+|([A-Z][a-z]*))\s)*([A-Z][a-z]*))?\z/
  RE_MIDDLEINITIAL = /\A[A-Z]?\z/
  RE_PHONE = /\A([-+()0-9\s]+)?\z/
  RE_URL = /\A((http|https):\/\/\S+)?\z/
  RE_EMAIL = /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z)|(\A((http|https):\/\/\S+)?\z)/i
  RE_YEAR = /\A(\d{4})?\z/
  RE_MONTH = /\A(0?[1-9])|(1[0-2])\z/
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true
  end
end
