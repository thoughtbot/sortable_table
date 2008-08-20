class UsersController < ApplicationController
  
  sortable_attributes :name, :age, :email => 'users.email'
  
  def index
    @users = User.find :all, :order => sort_order('ascending')
  end

end
