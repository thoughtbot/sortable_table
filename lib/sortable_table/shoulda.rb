class Test::Unit::TestCase
  
  def self.should_sort_by(attribute, &block)
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
        
        assert_not_nil assigns(collection), 
          "assigns(:#{collection}) is nil"
        assert assigns(collection).size >= 2, 
          "cannot test sorting without at least 2 sortable objects"
    
        expected = assigns(collection).sort_by(&block)
        expected = expected.reverse if direction == 'descending'
        
        assert expected == assigns(collection), 
          "expected - #{expected.map(&block).inspect}," <<
          " but was - #{assigns(collection).map(&block).inspect}"
      end
    end
  end
  
end