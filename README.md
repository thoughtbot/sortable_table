DEPRECATED
==========

Thoughtbot is no longer supporting this project. We have not used it a long time. If you would like to maintain it, please email hello@thoughtbot.com.

Sortable Table
==============

Sort HTML tables in your Rails app.

Install
-------

    script/plugin install git://github.com/thoughtbot/sortable_table.git

In app/controllers/application_controller.rb:

    class ApplicationController < ActionController::Base
      include SortableTable::App::Controllers::ApplicationController
    end

In app/helpers/application_helper.rb:

    module ApplicationHelper
      include SortableTable::App::Helpers::ApplicationHelper
    end

Testing
-------

    context "enough Users to sort" do
      setup do
        5.times { Factory :user }
      end

      should_sort_by_attributes :name, :email, :age, :group => "groups.name"

      context "GET to #index" do
        setup { get :index }

        should_display_sortable_table_header_for :name, :email, :age, :group
      end
    end

This is the common case for a RESTful UsersController.

* should_sort_by_attributes tests that the controller's index action can sort by the attributes.
* should_display_sortable_header_for tests that a sortable header displays for the attributes.

Controller
----------

    class UsersController < Admin::BaseController
      sortable_attributes :name, :email, :age, :group => "groups.name"

      def index
        @users = User.paginate :page => params[:page], :order => sort_order
      end
    end

sortable_attributes defines a sort_order method that gets called in your action.

If the index action is rendered without a params[:sort] option, @users will be sorted by :name, the first option in the list of sortable_attributes.

View
----

    <h1>Users</h1>
    <table>
      <tr>
        <%= sortable_table_header :name => "Name",  :sort => "name" %>
        <%= sortable_table_header :name => "Email", :sort => "email" %>
        <%= sortable_table_header :name => "Age",   :sort => "age" %>
        <%= sortable_table_header :name => "Group", :sort => "group" %>
      </tr>
      <% @users.each do |user| %>
        <tr>
          <td><%= html_escape(user.name) %></td>
          <td><%= html_escape(user.email) %></td>
          <td><%= html_escape(user.age) %></td>
          <td><%= html_escape(user.group.name) %></td>
        </tr>
      <% end %>
    </table>

sortable_table_header creates a table header containing a link with the correct :sort and :order params. It also has a class of "ascending" or "descending" so you can add styles with arrows. You can add your own styles as well.

Example styles
--------------

    th.ascending a {
      background: url(/images/sort-ascending-arrow.gif) 0% 50% no-repeat;
      padding-left: 15px;
    }

    th.descending a {
      background: url(/images/sort-descending-arrow.gif) 0% 50% no-repeat;
      padding-left: 15px;
    }

Overriding should_sort_by_attributes
------------------------------------

Opinionated defaults:

* GET to :index
* collection same name as controller (@users for UsersController)
* model name same name as controller (User for UsersController

If you need to test another action (or a nested controller), pass a block:

    should_sort_by_attributes :age do |sort, order|
      get :show, :sort => sort, :order => order, :group_id => @group.id
    end

If you need to test another collection or model name, use should_sort_by.

Overriding should_sort_by
-------------------------

The :collection, :model_name, and :action options of should_sort_by.

    context "with a non-standard collection name" do
      action = lambda { |sort, order| get :members, :sort => sort, :order => order }
      should_sort_by :name, { :collection => "members",
                              :model_name => "user",
                              :action     => action } do |user|
        user.name
      end
    end

sort_order
----------

The default sort order is descending. This applies to the first time you click on a table header. You can override this to be ascending:

    def index
      @users = User.find :all, :order => sort_order(:default => "ascending")
    end

Credits
-------

Thank you to all [the contributors](https://github.com/thoughtbot/sortable_table/contributors).

License
-------

Sortable Table is Copyright © 2008-2011 thoughtbot. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
