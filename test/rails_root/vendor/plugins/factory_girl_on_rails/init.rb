require 'factory_girl'
Dir[File.join(RAILS_ROOT, 'test', 'factories', '*.rb')].each do |file|
  require file
end