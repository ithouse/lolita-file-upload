Given /^a lolita$/ do
  
end

When /^I load lolita\-file\-upload$/ do
  
end

Then /^lolita should have file\-upload module$/ do
  Lolita.modules.include?(:file_upload).should be_true
end

Given /^a rails$/ do
  require 'rails'
  require 'lolita-file-upload/rails'
end

Then /^I have LolitaFileUpload engine$/ do
  defined?(LolitaFileUpload::Engine).should be_true
end

Given /^a lolita and lolita\-file\-upload$/ do
 
end

When /^I define a file tab for (\w+)$/ do |model_name|
  @file_tab=Support.file_tab(model_name)
end

Then /^I can set included extension type (\w+)$/ do |ext_name|
  @file_tab.extension(ext_name)
  @file_tab.extensions.size.should == 1
end

Given /^lolita\-file\-upload$/ do
  
end

Given /^rails engine$/ do
  Dir[File.expand_path("app/**/*.rb")].each do |path|
    require path
  end
end

Given /^file tab for (\w+)$/ do |model_name|
  @file_tab=Support.file_tab(model_name)
end

When /^I set maximum file upload size to (\d+)$/ do |size|
  @file_tab.maxsize(size)
end

Then /^I (c\w+)\supload file (\w+\.\w+)$/ do |predicate,file_name|
  file=Lolita::Multimedia::File.create(:asset=>Support.get_file(file_name))
  if predicate=="can"
    file.errors.should be_empty
  elsif predicate=="cannot"
    file.errors[:asset].should_not be_nil
  end
end

Then /^(\w+)\s+has association with ([\w:]+)$/ do |model_name,klass|
  model=Support.get_model(model_name)
  model.lolita.dbi.associations_klass_names.should include(klass)
end

Then /^association name for (\w+)\sis (:\w+)$/ do |model_name,assoc_name|
  model=Support.get_model(model_name)
  model.lolita.dbi.reflect_on_association(assoc_name).should_not be_nil
end

When /^I upload file normal_file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I see normal_file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I change file attribute name to my_file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^save file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I see my_file$/ do
  pending # express the regexp above with the code you wish you had
end


Then /^I have (get|post|delete|put) route (.+)$/ do |method,url|
  pending # express the regexp above with the code you wish you had
end
