require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "enough Users to sort" do
    setup { 2.times { Factory :user } }

    should_sort_by_attributes :name, :email, :age do |sort, order|
      get :index, :sort => sort, :order => order
    end

    context "GET to #index" do
      setup { get :index }
      should_display_sortable_table_header_for :name, :email, :age
    end
  end

end
