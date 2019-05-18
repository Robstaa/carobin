require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Carobin
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :de
  end
end
