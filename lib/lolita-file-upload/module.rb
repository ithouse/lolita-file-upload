# append route
Lolita.add_module Lolita::FileUpload, :nested=>true,:route=>lambda{|resource|
  if resource && resource.respond_to?(:lolita) && resource.lolita.tabs.by_type(:files)
    return :file_upload
  end
}
# append fixed gallery
Lolita::Hooks.component(:"/lolita/configuration/tabs/display").before do
  resource_class = self.send(:resource_class)
  if resource_class.lolita.tabs.by_type(:files)
    self.render_component(:"/lolita/configuration/tab/files", :fixed_gallery) 
  end
end