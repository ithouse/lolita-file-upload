module Lolita
  module Multimedia
    class File < ActiveRecord::Base
      set_table_name :lolita_files

      mount_uploader :asset, FileUploader
      belongs_to :fileable, :polymorphic=>true

      validate :size_limit
      
      
      private

      def size_limit
        if self.fileable && lolita=self.fileable.class.lolita
          maxsize=lolita.tabs.by_type(:file).maxfilesize
          if maxsize.to_i>0 && self.asset.file.size>maxsize
            bytes=Lolita::Support::Bytes.new(size)
            self.errors.add(:asset,"file too big (max #{bytes.value} #{bytes.unit})")
          end
        end
      end

    end
  end
end

