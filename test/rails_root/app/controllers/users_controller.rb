class UsersController < ApplicationController
  
  sortable_attributes :name, 
                      :age, 
                      :email, 
                      :group => "groups.name"
  
  def index
    @users = User.find :all, :order => sort_order("ascending")
  end

end
