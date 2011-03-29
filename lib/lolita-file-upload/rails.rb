if defined?(Rails)
  require "lolita-file-upload/rails/file_upload_routes"
  module LolitaFileUpload
    class Engine < Rails::Engine

    end
  end
end