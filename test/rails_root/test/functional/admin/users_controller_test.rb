require File.dirname(__FILE__) + '/../../test_helper'

class Admin::UsersControllerTest < ActionController::TestCase

  context "enough Users to sort" do
    setup do
      5.times { Factory :user }
    end

    should_sort_by_attributes :name, :email

    should_sort_by :group => 'groups.name' do |user|
      user.group.name
    end

    should_sort_by :age_and_name => ["age", "users.name"] do |user|
      "#{user.age}#{user.name}"
    end

    context "GET to #index" do
      setup { get :index }
      should_display_sortable_table_header_for :name, :email, :age, :group
    end
  end

end
