class ActionView::Base
  
  def sortable_table_header(*args)
    opts = args.extract_options!
    
    inner_html = args
    if inner_html.blank?
      raise ArgumentError "Must specify inner_html as first argument"
    end
    
    # if args.first.is_a?(String)
    #   inner_html = args.shift
    # elsif opts.first.is_a?(Hash)
    #   if opts.has_key?(:inner_html)
    #     inner_html = opts[:inner_html]
    #   else
    #     # raise ArgumentError unless opts.has_key?(:sort)
    #     inner_html = opts[:sort].humanize
    #   end
    # else
    #   raise ArgumentError, 
    #     "calling signature must be String, Hash or Hash"
    # end
    
    # anchor = opts[:anchor].blank? ? "" : "##{opts[:anchor]}"
    # sortable_url(opts) + anchor
  
    content_tag :th, 
      link_to(inner_html, 
        sortable_url(opts), 
        :title => opts[:title]),
      :class => class_name_for_sortable_table_header_tag(opts)
  end
  
  def class_name_for_sortable_table_header_tag(opts)
    if default_sort_to_most_recent? opts
      class_name = 'descending'
    elsif re_sort? opts
      class_name = params[:order]
    else
      class_name = ""
    end
    class_name << " #{opts[:class_name]}"
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
    params[:sort].nil? && opts[:sort] == @sorted_column
  end
  
  def re_sort?(opts)
    params[:sort] == opts[:sort]
  end
  
  def reverse_order(order)
    order == 'ascending' ? 'descending' : 'ascending'
  end

end