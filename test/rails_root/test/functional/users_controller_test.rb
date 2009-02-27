require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase

  context "given distinct user data to sort" do
    setup do
      4.times { Factory(:user, :admin => false) }
      Factory(:user, :admin => true)
    end

    should_fail do
      should_sort_by :undefined_attribute
    end

    should_sort_by_attributes :name, :admin

    should_sort_by :group => 'groups.name' do |user|
      user.group.name
    end

    should_sort_by :age_and_name => ["age", "users.name"] do |user|
      "#{user.age}#{user.name}"
    end

    # block form to test an action other than :index
    should_sort_by_attributes :email do |sort, order|
      get :show, :sort => sort, :order => order
    end

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

  # this is necessary because should_sort_by generates two tests, one of which
  # would pass if the data happened to be in order in the database already, and
  # we need to make sure they both fail when the attribute isn't listed as
  # sortable
  context "given randomly sorted data" do
    setup do
      Factory(:user, :email => 'u2@example.com')
      Factory(:user, :email => 'u1@example.com')
      Factory(:user, :email => 'u3@example.com')
    end

    should_fail do
      # attribute that isn't listed as sortable in the controller
      should_sort_by :email
    end
  end

  context "given two or more users with non-distinct data" do
    setup do
      2.times { Factory(:user, :name => 'Same Name') }
    end

    should_fail do
      should_sort_by :name
    end
  end

  context "given fewer than two users" do
    setup do
      Factory(:user)
    end

    should_fail do
      should_sort_by :name
    end
  end

end
