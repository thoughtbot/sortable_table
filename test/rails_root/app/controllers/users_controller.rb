class UsersController < ApplicationController

  sortable_attributes :name,
                      :age,
                      :email,
                      :group => "groups.name",
                      :name_and_email => ['name', 'users.email']

  def index
    @users = User.find :all, :order => sort_order("ascending")
    @users_dupe = @users
  end

end
