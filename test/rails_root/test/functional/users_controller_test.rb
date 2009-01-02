require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase

  context "enough Users to sort" do
    setup do
      5.times { Factory :user }
    end

    should_sort_by_attributes :name, :email, :group => "groups.name"

    # block form to test an action other than :index
    should_sort_by_attributes :age do |sort, order|
      get :show, :sort => sort, :order => order
    end

    # TODO:
    # should_sort_by :age_and_name => ["age", "users.name"]

    context "with a non-standard collection name" do
      action = lambda { |sort, order| get :members, :sort => sort, :order => order }
      should_sort_by :name, { :collection => "members", 
                              :model_name => "user",
                              :action     => action } do |user|
        user.name
      end
    end
    
    context "GET to #index" do
      setup { get :index }
      should_display_sortable_table_header_for :name, :email, :age, :group
    end
  end

end

