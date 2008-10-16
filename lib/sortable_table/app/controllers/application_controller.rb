module SortableTable
  module App
    module Controllers
      module ApplicationController
  
        def self.included(base)
          base.class_eval do
            include InstanceMethods
            extend ClassMethods
          end
        end
        
        module ClassMethods
          def sortable_attributes(*args)
            mappings           = args.last.is_a?(Hash) ? args.pop : {}
            acceptable_columns = args.collect(&:to_s) + mappings.keys.collect(&:to_s)

            define_method(:sort_order) do |*default| 
              direction = if params[:order]
                params[:order] == 'ascending' ? 'asc' : 'desc'
              else
                default_sort_direction(default)
              end
              column    = params[:sort] || 'created_at'
              if params[:sort] && acceptable_columns.include?(column)
                column = mappings[column.to_sym] || column
                "#{column} #{direction}"
              else
                "#{acceptable_columns.first} #{direction}"
              end
            end
          end
        end
        
        module InstanceMethods
          def default_sort_direction(default)
            if default.any? && default.first.is_a?(Hash) && default.first.has_key?(:default)
              default.first[:default] == 'ascending' ? 'asc' : 'desc'
            else
              'desc'  
            end
          end
        end

      end
    end
  end  
end


