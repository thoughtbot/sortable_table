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
            mappings           = pop_hash_from_list(args)
            acceptable_columns = join_array_and_hash_keys(args, mappings)
            
            define_method(:sort_order) do |*default| 
              direction = params[:order] == 'ascending' ? 'asc' : 'desc'
              column    = params[:sort] || 'created_on'
              if params[:sort] && acceptable_columns.include?(column)
                column = mappings[column.to_sym] || column
                if column.is_a?(Array)
                  column.map{ |col| "#{col} #{direction}" }.join(',')
                else
                  "#{column} #{direction}"
                end
              else
                "#{acceptable_columns.first} #{default_sort_direction(default)}"
              end
            end
          end
          
          def pop_hash_from_list(*args)
            if args.last.is_a?(Hash)
              args.pop
            else
              {}
            end
          end
          
          def join_array_and_hash_keys(array, hash)
            array.collect { |each| each.to_s } + 
              hash.keys.collect { |each| each.to_s }
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


