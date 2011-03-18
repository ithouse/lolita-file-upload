module Lolita
  module Multimedia
    class File < ActiveRecord::Base
      set_table_name :lolita_files

      mount_uploader :asset, FileUploader
      belongs_to :fileable, :polymorphic=>true
      
    end
  end
end

