require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "GET to #index with sort and order params" do
    setup do
      2.times { |each| Factory :user }
    end
  
    should_sort_by :name
    should_sort_by_attributes :email, :age do |sort, order|
      get :index, :sort => sort, :order => order
    end
  end

  context "GET to #index" do
    setup do
      2.times { |each| Factory :user }
      get :index
    end

    should_display_sortable_table_header_for :name, :email, :age
  end

end
