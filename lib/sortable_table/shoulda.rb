class Test::Unit::TestCase
  
  def self.should_sort_by(attribute, &block)
    collection = self.name.underscore.gsub(/_controller_test/, '')
    collection.slice!(0..collection.rindex('/'))
    collection = collection.to_sym
    block ||= attribute

    %w(ascending descending).each do |direction|
      should "sort by #{attribute.to_s} #{direction}" do
        get :index, :sort => attribute.to_s, :order => direction
        
        assert assigns(collection).size >= 2, 
          "cannot test sorting without at least 2 sortable objects"
    
        expected = assigns(collection).sort_by(&block)
        expected = expected.reverse if direction == 'descending'
        
        assert expected == assigns(collection) #, 
          "expected - #{expected.map(&block).inspect}," <<
          " but was - #{assigns(collection).map(&block).inspect}"
      end
    end
  end
  
end