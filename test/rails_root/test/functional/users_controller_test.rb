require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context 'GET to index with sort and order params' do
    setup do
      5.times do |each|
        Factory :user, :name => "name #{each}",
          :email => "email#{each}@example.com",
          :age => each
      end
    end
  
    should_sort_by :name
    should_sort_by :email # Hash syntax
    should_sort_by :age
  end
  
end
