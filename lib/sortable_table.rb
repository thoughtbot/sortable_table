# SortableTable

class ActionController::Base
  
  def self.sanitizes_order(*args)
    mappings = args.last.is_a?(Hash) ? args.pop : {}
    acceptable_columns = args.collect(&:to_s) + mappings.keys.collect(&:to_s)
    define_method(:sanitized_order) do 
      direction =  params[:order] == 'ascending' ? 'asc' : 'desc'
      column = params[:sort] || 'created_on'
      if acceptable_columns.include? column
        column = mappings[column.to_sym] || column
        "#{column} #{direction}"
      else
        sanitized_order acceptable_columns.first, 'descending'
      end
    end
  end
  
end
