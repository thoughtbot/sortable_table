require 'sortable_table/view_helper'
require 'sortable_table'

if defined?(Rails) && Rails.env == 'test'
  require 'sortable_table/shoulda'
end
