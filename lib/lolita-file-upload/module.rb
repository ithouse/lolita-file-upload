# append route
Lolita.add_module Lolita::FileUpload, :nested=>true,:route=>lambda{|resource|
  if resource.lolita.tabs.by_type(:files)
    return :file_upload
  end
}
# append fixed gallery
Lolita::Hooks.component(:"lolita/configuration/tab/default/display").before do
  render_component(:"lolita/configuration/tab/files", :fixed_gallery) if resource_class.lolita.tabs.by_type(:files)
end