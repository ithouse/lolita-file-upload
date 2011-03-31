class FileUploader < CarrierWave::Uploader::Base
  storage :file
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

end