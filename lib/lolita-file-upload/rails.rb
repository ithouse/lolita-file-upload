if defined?(Rails)
  require "lolita-file-upload/rails/file_upload_routes"
  module LolitaFileUpload
    class Engine < Rails::Engine
      initializer "remove assets directories from pipeline" do |app|
       app.config.assets.precompile += [
         "lolita/upload/application_vendor.js",
         "lolita/upload/application_vendor.css",
         "lolita/upload/I18n/lv.js",
         "lolita/upload/I18n/ru.js"
        ]
      end
    end
  end
end