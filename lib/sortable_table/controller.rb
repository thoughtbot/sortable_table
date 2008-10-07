class ActionController::Base
  
  def self.sortable_attributes(*args)
    mappings           = args.last.is_a?(Hash) ? args.pop : {}
    acceptable_columns = args.collect(&:to_s) + mappings.keys.collect(&:to_s)
  
    define_method(:sort_order) do |*default| 
      direction = params[:order] == 'ascending' ? 'asc' : 'desc'
      column    = params[:sort] || 'created_on'
      if params[:sort] && acceptable_columns.include?(column)
        column = mappings[column.to_sym] || column
        @sorted_column = column
        "#{column} #{direction}"
      else
        @sorted_column = acceptable_columns.first
        "#{acceptable_columns.first} #{default_sort_direction(default)}"
      end
    end
  end
  
  def default_sort_direction(default)
    if default.any? && default.first.is_a?(Hash) && default.first.has_key?(:default)
      default.first[:default] == 'ascending' ? 'asc' : 'desc'
    else
      'desc'  
    end
  end
  
end
