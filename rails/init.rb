require 'sortable/view'
require 'sortable/controller'

if defined?(Rails) && Rails.env == 'test'
  require 'sortable/test'
end
