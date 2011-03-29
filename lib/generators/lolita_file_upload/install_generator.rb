module LolitaFileUpload
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Lolita::Generators::FileHelper
      source_root File.expand_path("../templates", __FILE__)
      desc "Copy assets and create migrations. "


      def copy_assets
        generate("lolita_file_upload:assets")
      end

      def copy_migration
        copy_file "migration.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_create_lolita_upload_files.rb"
      end
     
    end
  end
end
