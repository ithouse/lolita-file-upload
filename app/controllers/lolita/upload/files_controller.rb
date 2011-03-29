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
        render_component :"lolita/tab/files",:row,:file=>@file, :tab=>@tab
      end

      def edit
        render_component :"lolita/tab/files", :edit, :file=>@file,:tab=>@tab
      end

      def update
        @file.update_attributes!(params[:file])
        render_component :"lolita/tab/files", :update, :file=>@file,:tab=>@tab
      end


      def destroy
        @file.destroy
        render_component :"lolita/tab/files",:destroy,:file=>@file,:tab=>@tab
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