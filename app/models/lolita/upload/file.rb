module Lolita
  module Upload
    class File < ActiveRecord::Base
      self.table_name = 'lolita_files'
      attr_accessible :asset, :name, :fileable_type, :asset_extension
      mount_uploader :asset, FileUploader
      belongs_to :fileable, polymorphic: true
      before_save :set_metadata

      private

      def set_metadata
        unless self.asset.blank?
          self.name ||= ::File.basename(self.asset.store_path)
          self.asset_size = self.asset.file.size
          self.asset_extension = ::File.extname(self.asset.store_path).gsub(".", "")
        end
      end

    end
  end
end

