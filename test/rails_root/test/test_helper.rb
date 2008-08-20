ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'rubygems'
require 'mocha'
require 'quietbacktrace'

require 'factory_girl'
Dir[File.join(RAILS_ROOT, 'test', 'factories', '*.rb')].each do |file|
  require file
end

class Test::Unit::TestCase
  
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

end
