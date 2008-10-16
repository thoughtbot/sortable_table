require 'rake'
require 'rake/testtask'
require 'date'
 
test_files_pattern = 'test/rails_root/test/{unit,functional,other}/**/*_test.rb'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = test_files_pattern
  t.verbose = false
end
 
desc "Run the test suite"
task :default => :test
 
spec = Gem::Specification.new do |s|
  s.name = "sortable_table"
  s.summary = "Sort HTML tables in a Rails app."
  s.email = "dcroak@thoughtbot.com"
  s.homepage = "http://github.com/dancroak/sortable_table"
  s.description = "Sort HTML tables in a Rails app."
  s.authors = ["Dan Croak", "Joe Ferris", "Boston.rb"]
  s.files = FileList["[A-Z]*", "{lib,rails,test}/**/*"]
end
 
begin
  require 'rubygems'
  require 'jeweler'
  Jeweler.gemspec = spec
rescue LoadError 
  puts "Jeweler not available. sudo gem install technicalpickles-jeweler --source=http://gems.github.com"
end
