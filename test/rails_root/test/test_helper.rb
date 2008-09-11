ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'rubygems'

gem 'mocha'
gem 'quietbacktrace'
gem 'thoughtbot-factory_girl' # from github
require 'mocha'
require 'quietbacktrace'

require 'factory_girl'
Dir[File.join(RAILS_ROOT, 'test', 'factories', '*.rb')].each do |file|
  require file
end

class Test::Unit::TestCase
  
  Test::Unit::TestCase.quiet_backtrace = false
  self.backtrace_silencers << :rails_vendor
  self.backtrace_filters   << :rails_root
  
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

end
