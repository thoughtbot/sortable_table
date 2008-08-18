class SortableTable

  module ViewHelper

    def sortable_table_header(opts = {})
      raise ArgumentError if opts[:name].nil? || opts[:sort].nil? || opts[:title].nil?
      anchor = opts[:anchor].blank? ? "" : "##{opts[:anchor]}"
      content_tag :th, 
        link_to(opts[:name], 
          sortable_url(opts) + anchor, 
          :title => opts[:title]),
        :class => class_name_for_sortable_table_header_tag(opts)
    end
  
    def class_name_for_sortable_table_header_tag(opts)
      if default_sort_to_most_recent? opts
        'descending'
      elsif re_sort? opts
        params[:order]
      else
        nil
      end
    end

  end

end