module Lolita::FileUpload
  class Engine < ::Rails::Engine
    initializer 'precompile', group: :all do |app|
      app.config.assets.precompile += %w(tinymce/plugins/lolita_gallery/plugin.js)
      app.config.assets.precompile << "lolita-file-upload-manifest.js" # Sprockets 4 manifest
    end
  end
end
