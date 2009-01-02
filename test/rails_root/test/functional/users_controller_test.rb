require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase

  context "enough Users to sort" do
    setup do
      Factory(:user, :name => 'a')
      Factory(:user, :name => 'b')
      Factory(:user, :email => 'a@a.com')
      Factory(:user, :email => 'b@b.com')
      Factory(:user, :age => 20)
      Factory(:user, :age => 30)
    end

    should_sort_by_attributes :name, :email

    should_sort_by "groups.name"
    should_sort_by :group => "groups.name"

    # block form    
    should_sort_by_attributes :age do |sort, order|
      get :index, :sort => sort, :order => order
    end

    # should_sort_by :name_and_email, {} do |user|
    #   "#{user.name} #{user.email}"
    # end

    context 'with a non-standard instance variable name' do
      should_sort_by :name, { :collection => 'users_dupe', :model_name => 'user' } do |user|
        user.name
      end
    end

    context "GET to #index" do
      setup { get :index }
      should_display_sortable_table_header_for :name, :email, :age
    end
  end

end

