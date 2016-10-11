require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LearnRailsAssessment
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # This sets the layouts for devise views
    config.to_prepare do
      Devise::SessionsController.layout "home"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "home" }
      Devise::ConfirmationsController.layout "home"
      Devise::UnlocksController.layout "home"
      Devise::PasswordsController.layout "home"
    end
  end
end
