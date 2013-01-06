require 'activeadmin-sortable/version'
require 'activeadmin'
require 'rails/engine'

module ActiveAdmin
  module Sortable
    module ControllerActions
      def sortable
        member_action :sort, :method => :post do
          resource.insert_at params[:position].to_i
          head 200
        end
      end
    end

    module TableMethods
      HANDLE = '&#x2195;'.html_safe

      def sortable_handle_column
        column '' do |resource|
          if parent?
            sort_url = url_for([:sort, :admin, parent_type, resource])
          else
            sort_url = url_for([:sort, :admin, resource])
          end
          content_tag :span, HANDLE, :class => 'handle', 'data-sort-url' => sort_url
        end
      end
    end

    ::ActiveAdmin::ResourceDSL.send(:include, ControllerActions)
    ::ActiveAdmin::Views::TableFor.send(:include, TableMethods)

    class Engine < ::Rails::Engine
      # Including an Engine tells Rails that this gem contains assets
    end
  end
end


