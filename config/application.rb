require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true
  end
end

RSpotify::authenticate("6dd9a817b20d40da87c98bb33a796dce", "86244d087e364c5d8e009fade414634a")
