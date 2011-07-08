Gem::Specification.new do |s|
  s.name        = %q{sortable_table}
  s.version     = '0.0.7'
  s.summary     = %q{Sort HTML tables in a Rails app.}
  s.description = %q{Sort HTML tables in a Rails app.}

  s.files        = %w(MIT-LICENSE
                      Rakefile
                      README.md
                      TODO.textile
                      lib/sortable_table
                      lib/sortable_table/app
                      lib/sortable_table/app/controllers
                      lib/sortable_table/app/controllers/application_controller.rb
                      lib/sortable_table/app/helpers
                      lib/sortable_table/app/helpers/application_helper.rb
                      lib/sortable_table.rb
                      rails/init.rb)
  s.require_path = 'lib'
  s.test_files   = Dir['test/**/*']

  s.has_rdoc = false

  s.authors = ["Dan Croak", "Joe Ferris", "Mike Burns", "Jon Yurek", "Boston.rb"]
  s.email   = %q{support@thoughtbot.com}
  s.homepage = "http://github.com/thoughtbot/sortable_table"

  s.platform = Gem::Platform::RUBY
  s.rubygems_version = %q{1.2.0}
end
