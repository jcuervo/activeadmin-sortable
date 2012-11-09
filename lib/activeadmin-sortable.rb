require 'activeadmin-sortable/version'
require 'activeadmin'

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
          sort_url = url_for([:sort, :admin, resource])
          content_tag :span, HANDLE, :class => 'handle', 'data-sort-url' => sort_url
        end
      end
    end
  end

  ::ActiveAdmin::ResourceDSL.send(:include, Sortable::ControllerActions)
  ::ActiveAdmin::Views::TableFor.send(:include, Sortable::TableMethods)
end
