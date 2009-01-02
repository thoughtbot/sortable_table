class UsersController < ApplicationController

  sortable_attributes :name,
                      :age,
                      :email,
                      :group => "groups.name",
                      :age_and_name => ["age", "users.name"]

  def index
    @users      = User.find :all, :order => sort_order("ascending")
    @users_dupe = @users
  end

end
