require "rails"
require "active_model/railtie"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    config.load_defaults 7.2
    config.eager_load = false
    config.enable_reloading = true
  end
end
