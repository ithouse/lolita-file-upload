Given /^a lolita$/ do
  
end

When /^I load lolita\-file\-upload gem$/ do
  
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
  model=Object.const_get(:"#{model_name.humanize}")
  @file_tab=Lolita::Configuration::Tab.new(model.lolita.dbi,:files)
  model.lolita.tabs<<@file_tab
end

Then /^I can set included extension type (\w+)$/ do |ext_name|
  @file_tab.extension(ext_name)
  @file_tab.extensions.size.should == 1
end

Given /^lolita\-file\-upload$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^file tab$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I set maximum file upload size to (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I cannot upload file larg_file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^lolita orm class has association with Lolita::Multimedia::File$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^association name is :files$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^lolita$/ do
  pending # express the regexp above with the code you wish you had
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
