#TODO add exception if lolita not found, show exception and msg that user should install this gem
# if files tab is defined, but there no tab for that, maybe check that through gem.
if !defined?(Lolita)
  require "lolita" 
end
$:<<File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__))

I18n.load_path += Dir[File.expand_path("config/locales")+"/**/*.yml"] if defined?(I18n)

module Lolita
  module FileUpload
  end
  module Support
    autoload :Bytes, "support/bytes"
  end
  
  module Configuration
    module Tab
    	autoload :Files, "lolita-file-upload/configuration/tab/files"
    end
    # module Field
    #   autoload :Upload, "lolita-file-upload/configuration/field/upload"
    # end
  end
end

require 'lolita-file-upload/module'

if defined?(Rails)
 require "lolita-file-upload/rails"
end

# How to connect multimedia engine with lolita resources
# Detecting from tabs will not be very good idea because it will load many thing 
# There should be the way to connect it on demand when realy multimedia tab is used for resource like
# lolita/posts/files/new[create,destroy,update, index]