class FileUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    storage :file
    after :remove, :delete_empty_upstream_dirs

    version :normalized, :if => :image? do
      process :resize_to_fit => [600,600]
    end

    def timestamp
      time=if model
        model.created_at || Time.now
      else
        Time.now
      end
      time.strftime("%Y%m")
    end

    # With slash in first place it will be absolute url, otherwise relative to Rails.root+"/public"
    def store_dir
      if model
        "uploads/#{model.class.to_s.underscore}/#{timestamp}/#{model.id}"
      else
        "uploads/misc"
      end
    end

    def delete_empty_upstream_dirs
      path = ::File.expand_path(store_dir, root)
      Dir.delete(path) # fails if path not empty dir
      
     # path = ::File.expand_path(base_store_dir, root)
     # Dir.delete(path) # fails if path not empty dir
    rescue SystemCallError
      true # nothing, the dir is not empty
    end

    def image?(file)
      File.extname(file.filename.to_s).match(/jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF/)
    end

end