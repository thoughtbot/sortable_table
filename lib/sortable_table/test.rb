class Test::Unit::TestCase
  
  def self.should_sort_by(attribute, params = {}, &block)
    collection = self.name.underscore.gsub(/_controller_test/, '')
    collection.slice!(0..collection.rindex('/')) if collection.include?('/')
    collection = collection.to_sym
    model_name = collection.to_s.singularize.camelize.constantize
    block ||= attribute

    %w(ascending descending).each do |direction|
      should "sort by #{attribute.to_s} #{direction}" do
        assert_not_nil model_name.find(:all).any?,
          "#{model_name}.find(:all) is nil"
        
        get :index, :sort => attribute.to_s, :order => direction
        
        # controller tests
        
        assert_not_nil assigns(collection), 
          "assigns(:#{collection}) is nil"
        assert assigns(collection).size >= 2, 
          "cannot test sorting without at least 2 sortable objects"
    
        expected = assigns(collection).sort_by(&block)
        expected = expected.reverse if direction == 'descending'
        
        assert expected == assigns(collection), 
          "expected - #{expected.map(&block).inspect}," <<
          " but was - #{assigns(collection).map(&block).inspect}"
        
        # view tests
          
        view_helper_error_message = "Include the sortable_table_header" <<
          " helper in your view with the option :sort => '#{attribute}'"
        
        assert_select "th" do
          assert_select "a[href*=?]", "sort=#{attribute.to_s}", 
            true, view_helper_error_message
        end
      end
    end
  end
  
  def stubbed_action_view
    view = ActionView::Base.new(@controller.class.view_paths, {}, @controller)
    yield view
    ActionView::Base.stubs(:new).returns(view)
  end
  
end