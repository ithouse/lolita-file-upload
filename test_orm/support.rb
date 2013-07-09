module Support
  class << self
    def get_model from
      Object.const_get(:"#{from.humanize}")
    end
    
    def file_tab model_name,*args,&block
      from=Support.get_model(model_name)
      Lolita::Configuration::FilesTab.new(from.lolita.dbi,*args,&block)
    end

    def get_file(filename)
      File.open(File.expand_path("test_orm/files/"+filename.to_s))
    end

    def load_rails_application
      require 'rails'
      require 'lolita'
      require 'lolita-file-upload/rails'
      require File.expand_path("test_orm/rails/config/enviroment")
    end
  end
end

at_exit do
  FileUtils.rm_rf(File.expand_path("uploads"))
end