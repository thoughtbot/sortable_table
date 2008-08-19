class SortableTable

  module ViewHelper

    def sortable_table_header(opts = {})
      raise ArgumentError if opts[:name].nil? || opts[:sort].nil?
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
    
    def sortable_url(opts)
      url_for(params.merge(:sort => opts[:sort], :order => link_sort_order(opts), :page => 1))
    end

    def link_sort_order(opts)
      if default_sort_to_most_recent? opts
        'ascending'
      elsif re_sort? opts
        reverse_order params[:order]
      else
        'ascending'
      end
    end
    
    def default_sort_to_most_recent?(opts)
      params[:sort].nil? && opts[:sort] == 'date'
    end

    def re_sort?(opts)
      params[:sort] == opts[:sort]
    end

    def reverse_order(order)
      order == 'ascending' ? 'descending' : 'ascending'
    end

  end

end