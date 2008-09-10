# http://github.com/yfactorial/utility_scopes

Rails::Initializer.run do |config|
  # ...
  config.gem "yfactorial-utility_scopes", :lib => 'utility_scopes', 
    :source => 'http://gems.github.com/'
end

# rake gems:install GEM=yfactorial-utility_scopes

class Article < ActiveRecord::Base
  
  # Order the results by the given argument, or 'created_at DESC'
  # if no arg is given
  named_scope :ordered, lambda { |*order|
    { :order => order.flatten.first || 'created_at DESC' }
  }

end

# Get all articles ordered by 'created_at DESC'
Article.ordered #=> [<Article id: ...>, <..>]

# Get all articles ordered by 'updated_at DESC'
Article.ordered('updated_at DESC') #=> [<Article id: ...>, <..>]

class Article < ActiveRecord::Base

  # This class's default ordering (if not specified
  # defaults to 'created_at DESC'
  ordered_by 'published_at DESC'
  
  # By default, return 15 results (if not specified
  # defaults to 10
  default_limit 15

end

# Get the first 15 articles ordered by 'published_at DESC'
Article.ordered.limited #=> [<Article id: ...>, <..>]

# Get the first 15 articles ordered by 'popularity ASC'
Article.ordered('popularity ASC').limited #=> [<Article id: ...>, <..>]

# Get the first 20 articles ordered by 'popularity ASC'
Article.ordered('popularity ASC').limited(20) #=> [<Article id: ...>, <..>]

