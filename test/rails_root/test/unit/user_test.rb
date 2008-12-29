require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  context "a User" do
    setup { Factory :user }
    should_belong_to :group
  end
end
