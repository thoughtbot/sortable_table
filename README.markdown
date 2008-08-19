Sortable Table
==============

Thanks to Joe Ferris and Boston.rb.

Examples
--------

Use the sortable_attributes macro to list the... sortable attributes.

Then, in your index action, pass the sort_order method to your usual
order parameter for will paginate or named scope call.

    class UsersController < Admin::BaseController

		  sortable_attributes :name, :email

		  def index
		    @users = User.paginate :page => params[:page], :order => sort_order
		  end
		
		end

Time-saving Shoulda macros for your tests:

    class UsersControllerTest < ActionController::TestCase

    	context 'GET to index with sort and order params' do
		    setup do
		      5.times do |each|
			      Factory :user,
			        :name => "name #{each}",
			        :email => "email#{each}@example.com"
			    end
		    end

		    should_sort_by :name
		    should_sort_by :email
		  end
		
		end

Copyright (c) 2008 Dan Croak, released under the MIT license
