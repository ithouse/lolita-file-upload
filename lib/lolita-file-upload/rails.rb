if defined?(Rails)
  require "lolita-file-upload/rails/file_upload_routes"
  module LolitaFileUpload
    class Engine < Rails::Engine
      initializer "remove assets directories from pipeline" do |app|
       app.config.assets.precompile += %w(lolita/upload/application_vendor.js lolita/upload/application_vendor.css)
      end
    end
  end
end