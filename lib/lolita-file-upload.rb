require File.expand_path('../../../lolita/lib/lolita',__FILE__) # TODO remove this 

$:<<File.dirname(__FILE__)
 
require "lolita-file-upload/module"
module Lolita
  module FileUpload
  	
  end

  module Configuration
  	autoload :FileTab, "lolita-file-upload/configuration/tab/file"
  end
end

if defined?(Rails)
 require "lolita-file-upload/rails"
end

# How to connect multimedia engine with lolita resources
# Detecting from tabs will not be very good idea because it will load many thing 
# There should be the way to connect it on demand when realy multimedia tab is used for resource like
# lolita/posts/files/new[create,destroy,update, index]