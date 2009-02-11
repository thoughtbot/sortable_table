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
            if re_sort?(opts) || sorting_default?(opts)
              sortable_table_direction
            end
          end

          def sorting_default?(opts)
            params[:sort].nil? && opts[:sort] == default_sort_column
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
            if re_sort? opts
              reverse_order params[:order]
            else
              reverse_order sortable_table_direction
            end
          end
        end
        
      end
    end
  end
end
