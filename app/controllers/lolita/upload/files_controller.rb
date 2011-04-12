module Lolita
  module Upload
    class FilesController < ApplicationController
      include Lolita::Controllers::UserHelpers
      include Lolita::Controllers::InternalHelpers
      before_filter :authenticate_lolita_user!
      before_filter :build_file, :only=>[:create]
      before_filter :set_file, :only=>[:edit,:update,:destroy]
      before_filter :set_tab, :only=>[:edit,:update,:destroy,:create]

      respond_to :js,:html

      def create
        @file.asset = params[:file]  
        @file.save! 
        render_component *@tab.build("",:row,:file=>@file)
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

      def build_file
        @file = Lolita::Upload::File.new(params[:upload]) 
      end

      def set_file
        dbi=Lolita::DBI::Base.new(Lolita::Upload::File)
        @file=dbi.find_by_id(params[:id]) || build_file
      end

      def set_tab
        fileable_class=@file.fileable_type.constantize
        @tab=fileable_class.lolita.tabs.by_type(:files)
      end
    end
  end
end