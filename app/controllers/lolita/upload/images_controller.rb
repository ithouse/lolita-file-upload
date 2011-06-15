module Lolita
  module Upload
    class ImagesController < ApplicationController

      include Lolita::Controllers::UserHelpers
      include Lolita::Controllers::InternalHelpers
      before_filter :authenticate_lolita_user!
      before_filter :get_or_build_resource, :only=>[:create,:edit,:update,:destroy]
      before_filter :set_tab, :only=>[:edit,:update,:destroy,:create]

       respond_to :js,:html

      def create
        @resource.send("#{params[:field]}=".to_sym, params[:file])
        @resource.save!(:validate => false)
        render_component @tab, :row, :file => @resource
      end

      def edit
        render_component *@tab.build("",:edit,:file=>@file)
      end

      def update
        @file.update_attributes!(params[:file])
        render_component *@tab.build("",:update,:file=>@file)
      end


      def destroy
        @file.destroy
        render_component *@tab.build("",:destroy,:file=>@file)
      end

      private

      def get_or_build_resource
        @klass = params[:resource_class].camelize.constantize
        @resource = if params[:many] 
         # @klass.new(params[:upload])
        else
          @klass.find_by_id(params[:resource_id])
        end
      end

      def set_tab
        @tab = @klass.lolita.tabs.select{|tab|
          tab.type == :images && tab.tab_field == params[:field].to_sym
        }
      end
    end
  end
end