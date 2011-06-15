module Lolita
  module Upload
    class File < ActiveRecord::Base
      set_table_name :lolita_files

      mount_uploader :asset, FileUploader
      belongs_to :fileable, :polymorphic=>true

      validate :size_limit
      before_save :set_metadata
      before_create :singularize_files
      

      private

      def singularize_files
        if self.fileable && lolita = self.fileable.class.lolita
          if lolita.tabs.by_type(:files).association_type == :one
            self.class.destroy_all(["fileable_type = :type AND fileable_id = :id AND fileable_id > 0",:type => fileable_type,:id => fileable_id])
          end
        end
      end

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
        self.name||=::File.basename(self.asset.store_path)
        self.asset_size=self.asset.file.size
        self.asset_extension=::File.extname(self.asset.store_path).gsub(".","")
      end

    end
  end
end

