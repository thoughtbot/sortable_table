ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'rubygems'

require File.expand_path(File.dirname(__FILE__) + '/helper_testcase')
require File.expand_path(File.dirname(__FILE__) + '/shoulda_macros')

Dir[File.join(RAILS_ROOT, 'test', 'factories', '*.rb')].each do |file|
  require file
end

class Test::Unit::TestCase
  
  self.backtrace_silencers << :rails_vendor
  self.backtrace_filters   << :rails_root
  
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

end
