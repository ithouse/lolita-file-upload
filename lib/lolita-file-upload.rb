#TODO add exception if lolita not found, show exception and msg that user should install this gem
# if files tab is defined, but there no tab for that, maybe check that through gem.
if !defined?(Lolita)
  require "lolita" 
end
$:<<File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__))

I18n.load_path += Dir[File.expand_path("config/locales")+"/**/*.yml"] if defined?(I18n)

module Lolita
  module FileUpload
    class << self
      def get_available_file_icons
        @available_file_icons ||= {}.tap do |results|
          Dir.entries(::File.dirname(__FILE__) + "/../app/assets/images/lolita/file-icons").each do |item|
            if ::File.extname(item) == '.png'
              results[::File.basename(item, '.png')] =
                ActionController::Base.helpers.asset_path(::File.join('lolita/file-icons', ::File.basename(item)))
            end
          end
        end
      end
    end
  end
  module Support
    autoload :Bytes, "support/bytes"
  end
  
  module Configuration
    module Tab
    	autoload :Files, "lolita-file-upload/configuration/tab/files"
    end
    module Field
      autoload :File, "lolita-file-upload/configuration/field/file"
    end
  end
end

Lolita::Hooks.component(:"/lolita/configuration/tab/form").around do
  tab = self.component_locals[:tab]
  if tab.is_a?(Lolita::Configuration::Tab::Files)
    self.render_component(*tab.build)
  else
    let_content
  end
end

require 'lolita-file-upload/module'

if defined?(Rails)
 require "lolita-file-upload/rails"
end

Lolita.after_setup do 
  Lolita.application.assets << "lolita/file-upload/application_vendor.css"
  Lolita.application.assets <<  "lolita/file-upload/application_vendor.js"
  Lolita.application.assets <<  "lolita/file-upload/application.css"
  Lolita.application.assets <<  "lolita/file-upload/application.js"
end

# How to connect multimedia engine with lolita resources
# Detecting from tabs will not be very good idea because it will load many thing 
# There should be the way to connect it on demand when realy multimedia tab is used for resource like
# lolita/posts/files/new[create,destroy,update, index]