require File.expand_path('test_orm/coverage')
require File.expand_path("lib/lolita-file-upload")
require "carrierwave"

require "ruby-debug"
current_orm=:active_record
require 'carrierwave/orm/'+current_orm.to_s.gsub("_","")

require File.expand_path("test_orm/#{current_orm}")

require File.expand_path("test_orm/support")



 
