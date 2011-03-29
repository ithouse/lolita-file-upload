module Lolita
  module Upload
    class File < ActiveRecord::Base
      set_table_name :lolita_files

      mount_uploader :asset, FileUploader
      belongs_to :fileable, :polymorphic=>true

      validate :size_limit
      before_save :set_metadata
      

      private

      def size_limit
        if self.fileable && lolita=self.fileable.class.lolita
          maxsize=lolita.tabs.by_type(:files).maxfilesize
          if maxsize.to_i>0 && self.asset.file.size>maxsize
            bytes=Lolita::Support::Bytes.new(maxsize)
            self.errors.add(:asset,I18n.t("lolita.upload.errors.file too big",:value=>bytes.value,:unit=>bytes.unit))
          end
        end
      end

      def set_metadata
        self.name||=::File.basename(self.asset.to_s)
        self.asset_size=self.asset.file.size
        self.asset_extension=::File.extname(self.asset.to_s).gsub(".","")
      end

    end
  end
end

