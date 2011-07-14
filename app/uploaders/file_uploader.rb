class FileUploader < CarrierWave::Uploader::Base
    storage :file
    after :remove, :delete_empty_upstream_dirs

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
        "upload/#{model.class.to_s.underscore}/#{timestamp}/#{model.id}"
      else
        "upload/misc"
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

end