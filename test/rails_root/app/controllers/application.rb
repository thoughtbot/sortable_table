class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  include SortableTable::App::Controllers::ApplicationController
end
