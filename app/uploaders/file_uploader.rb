class FileUploader < CarrierWave::Uploader::Base
  storage :file
    def timestamp
      (model.created_at || Time.now).strftime("%Y%m")
    end

    # With slash in first place it will be absolute url, otherwise relative to Rails.root+"/public"
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{timestamp}/#{model.id}"
    end

end