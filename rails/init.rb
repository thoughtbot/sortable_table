require 'sortable_table/view'
require 'sortable_table/controller'

if defined?(Rails) && Rails.env == 'test'
  require 'sortable_table/test'
end
