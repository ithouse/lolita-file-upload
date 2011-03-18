require File.expand_path('test_orm/coverage')
require File.expand_path("lib/lolita-file-upload")
require "carrierwave"
require 'carrierwave/orm/activerecord'
require "ruby-debug"
current_orm=:active_record

require File.expand_path("test_orm/#{current_orm}")

module Support
  class << self
    def get_model from
      Object.const_get(:"#{from.humanize}")
    end
    
    def file_tab model_name,*args,&block
      from=Support.get_model(model_name)
      Lolita::Configuration::FileTab.new(from.lolita.dbi,*args,&block)
    end

    def get_file(filename)
      File.open(File.expand_path("test_orm/files/"+filename.to_s))
    end
  end
end



 
