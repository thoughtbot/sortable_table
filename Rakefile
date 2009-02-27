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
  s.version = '0.0.6'
  s.name = "sortable_table"
  s.summary = "Sort HTML tables in a Rails app."
  s.email = "dcroak@thoughtbot.com"
  s.homepage = "http://github.com/dancroak/sortable_table"
  s.description = "Sort HTML tables in a Rails app."
  s.authors = ["Dan Croak", "Joe Ferris", "Jon Yurek", "Boston.rb"]
  s.files = FileList["[A-Z]*", "{lib,rails}/**/*"]
end

desc "Generate a gemspec file"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_yaml
  end
end
