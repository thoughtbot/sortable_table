class UsersController < ApplicationController
  
  sortable_attributes :name, :email => 'users.email'
  
  def index
    @users = User.find :all, :order => sort_order('ascending')
  end

end
