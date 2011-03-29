Lolita.add_module Lolita::FileUpload, :nested=>false,:route=>lambda{|resource|
  if resource.lolita.tabs.by_type(:files)
    return :file_upload
  end
}

