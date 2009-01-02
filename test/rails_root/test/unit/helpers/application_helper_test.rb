require File.dirname(__FILE__) + '/../../test_helper'

class ApplicationHelperTest < HelperTestCase

  include ApplicationHelper
  
  context 'sortable_table_header' do
    setup do
      self.stubs(:params).returns({ :controller => :jobs, :action => :index, :sort => nil, :order => nil })
    end

    [:name, :sort].each do |param|
      should "raise an error without default param #{param}" do
        opts = { :name => 'name', :sort => 'sort' }
        opts.delete param
        assert_raise(ArgumentError) do
          sortable_table_header opts
        end
      end
    end

    context 'with no params[:sort] or params[:order]' do
      setup do
        @html = sortable_table_header(:name  => 'Title', 
                                      :sort  => 'title', 
                                      :title => 'Sort by title')
      end

      should 'return a table header without a class attribute' do
        assert @html.include?('<th>')
      end
    end
    
    context 'with params[:class]' do
      setup do
        @html = sortable_table_header(:name  => 'Title', 
                                      :sort  => 'title', 
                                      :title => 'Sort by title', 
                                      :class => "hr_class")
      end
      
      should 'return a table header with a class attribute equal to the passed in class' do
        assert @html.include?('<th class="hr_class"')
      end
    end

    context "without an :anchor" do
      setup do
        @html = sortable_table_header(:name  => 'Title', 
                                      :sort  => 'title', 
                                      :title => 'Sort by title')
      end

      should 'return a link that contains a url with no anchor' do
        assert @html.match(/href="[^#]+?"/)
      end
    end

    context "with an :anchor" do
      setup do
        @html = sortable_table_header(:name   => 'Title', 
                                      :sort   => 'title', 
                                      :title  => 'Sort by title', 
                                      :anchor => 'search-results')
      end

      should 'return a link that contains a url with that anchor' do
        assert @html.match(/href="[^"]*?#search-results"/)
      end
    end
  end

end