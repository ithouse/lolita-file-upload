if defined?(Rails)
  require "lolita-file-upload/rails/file_upload_routes"
  module LolitaFileUpload
    class Engine < Rails::Engine
      initializer "add assets directories to pipeline", :group => :all do |app|
       app.config.assets.precompile += [
         "lolita/file-upload/application_vendor.js",
         "lolita/file-upload/application_vendor.css",
         "lolita/file-upload/I18n/lv.js",
         "lolita/file-upload/I18n/ru.js"
        ]
      end
    end
  end
end