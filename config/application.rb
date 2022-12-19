require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuestionnaireApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    #config.action_mailer.delivery_method = :smtp
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.action_mailer.smtp_settings = {
    #   address:              'smtp.gmail.com',
    #   port:                 587,
    #   domain:               'example.com',
    #   user_name:            'udaykumardas950@gmail.com',
    #   password:             'Shiv@123*',
    #   authentication:       'plain',
    #   enable_starttls_auto: true  
    # }
    config.action_mailer.default_url_options = { :host => 'quiet-retreat-08806.herokuapp.com/' }
    config.action_mailer.raise_delivery_errors = true
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.smtp_settings = {
    :address   => "smtp.gmail.com",
    :domain => 'herokuapp.com',
    :port      => 25,
    :user_name => "udaykumardas950@gmail.com",
    :password  => 'Shiv@123*', 
    :authentication => :plain,
    :enable_starttls_auto => true
    }
    config.assets.initialize_on_precompile = false
    #ActionMailer::Base.default_content_type = "text/html"
  end
end
