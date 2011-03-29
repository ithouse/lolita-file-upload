require 'generators/helpers/file_helper'
module LolitaFileUpload
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      include Lolita::Generators::FileHelper
      desc "Copy all from public directory to project public directory."
      def copy_all
        copy_dir("public")
      end      
    end
  end
end