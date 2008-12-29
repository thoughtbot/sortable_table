# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '>=2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_rails_root_session',
    :secret      => '6042b566bbfa8e55bdb33a4b3b39b3c373e035c0a87b587a614db4c8bfea19a7adbd49f2098d4c995e37b28f6539e309f4bc5885cf023b47d5fe9d4450be2d46'
  }
  
  config.gem 'mocha',
             :version => '>= 0.9.3'
  config.gem 'quietbacktrace',
             :version => '>= 0.1.1'
  config.gem 'thoughtbot-factory_girl',
             :lib => 'factory_girl',
             :source => 'http://gems.github.com',
             :version => '>= 1.1.5'
  config.gem 'thoughtbot-shoulda',
             :lib => 'shoulda',
             :source => 'http://gems.github.com',
             :version => '>= 2.0.6'

end
