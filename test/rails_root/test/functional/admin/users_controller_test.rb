require File.dirname(__FILE__) + '/../../test_helper'

class Admin::UsersControllerTest < ActionController::TestCase

  context "enough Users to sort" do
    setup do
      5.times { Factory :user }
    end

    should_sort_by_attributes :name, :email

    # TODO: this was unimplemented
    # should_sort_by_attributes :group => "groups.name"

    context "GET to #index" do
      setup { get :index }
      should_display_sortable_table_header_for :name, :email, :age, :group
    end
  end

end

