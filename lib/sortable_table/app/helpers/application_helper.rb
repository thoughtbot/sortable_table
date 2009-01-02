module SortableTable
  module App
    module Helpers
      module ApplicationHelper
      
        def self.included(base)
          base.class_eval do
            include InstanceMethods
          end
        end
        
        module InstanceMethods
          def sortable_table_header(opts = {})
            raise ArgumentError if opts[:name].nil? || opts[:sort].nil?
            anchor = opts[:anchor].blank? ? "" : "##{opts[:anchor]}"
            content_tag :th, 
              link_to(opts[:name], 
                sortable_url(opts) + anchor, 
                :title => opts[:title]),
              :class => sortable_table_header_classes(opts)
          end

          def sortable_table_header_classes(opts)
            class_names = []
            class_names << sortable_table_header_class(opts) 
            class_names << opts[:class]
            class_names.compact.blank? ? nil : class_names.compact.join(" ")
          end
          
          def sortable_table_header_class(opts)
            if default_sort_to_most_recent? opts
              'descending'
            elsif re_sort? opts
              params[:order]
            else
              nil
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
        end
        
      end
    end
  end
end