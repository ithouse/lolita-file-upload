module Lolita
  module Upload
    class UploadersController < ApplicationController
      include Lolita::Controllers::UserHelpers
      include Lolita::Controllers::InternalHelpers
      before_filter :authenticate_lolita_user!
      before_filter :set_object, :only=>[:edit,:update,:destroy,:create]
      before_filter :set_tab, :only=>[:edit,:update,:destroy,:create]
      before_filter :set_file, :only=>[:edit,:update,:destroy,:create]

      respond_to :js,:html

      def create
        @file[uploader_name] = params[:file]  
        @file.save! 
        render_component *@tab.build("",:row,:file=>@file)
      end

      def edit
        render_component *@tab.build("",:edit,:file=>@file)
      end

      def update
        @file.update_attributes!(params[:file]) if @file.class == Lolita::Upload::File
        render_component *@tab.build("",:update,:file=>@file)
      end


      def destroy
        if @tab.association_type == :self
          @file.send(:"remove_#{uploader_name}!")
        else
          @file.destroy
        end
        render_component *@tab.build("",:destroy,:file=>@file)
      end

      private

      def build_file
        @file = @tab.association.klass.new(params[:upload])
      end

      def set_object
        @object = params[:upload][:fileable_type].constantize
      end

      def set_file
        @file = if @tab.association_type == :self
          @object
        else
          dbi=Lolita::DBI::Base.new(@tab.association.klass)
          dbi.find_by_id(params[:id]) || build_file
        end
      end

      def set_tab
        @tab=tab_by_uploader(params[:uploader])
      end

      def tab_by_uploader name
        @object.lolita.tabs.detect{|tab| tab.type == :files && tab.try(:uploader) == name.to_sym}
      end

      def uploader_name
        params[:uploader].to_sym
      end
    end
  end
end