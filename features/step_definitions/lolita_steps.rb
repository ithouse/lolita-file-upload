Given /^a lolita$/ do
  
end

When /^I load lolita\-file\-upload$/ do
  require "lolita-file-upload"
end

Then /^lolita should have file\-upload module$/ do
  Lolita.modules.include?(Lolita::FileUpload).should be_true
end

Given /^a rails$/ do
  require 'rails'
  require 'lolita/rails/all'
  require 'lolita-file-upload/rails'
end

Given /^rails application$/ do
  require File.expand_path("test_orm/rails/config/enviroment")
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

Given /^file tab for (\w+)$/ do |model_name|
  @file_tab=Support.file_tab(model_name)
end

When /^I set maximum file upload size to (\d+)$/ do |size|
  @file_tab.maxfilesize(size)
end

Then /^I (c\w+)\supload file (\w+\.\w+)$/ do |predicate,file_name|
  file=Lolita::Upload::File.create(:asset=>Support.get_file(file_name))
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

Then /^association name for (\w+)\sis :(\w+)$/ do |model_name,assoc_name|
  model=Support.get_model(model_name)
  model.lolita.dbi.reflect_on_association(assoc_name.to_sym).should_not be_nil
end

When /^I upload file (.+)$/ do |file_name|
  pending # express the regexp above with the code you wish you had
end

Then /^I see (\w+)$/ do |file_name|
  pending # express the regexp above with the code you wish you had
end

Then /^I change file attribute ([^\s]) to (\w+)$/ do |attribute,value|
  pending # express the regexp above with the code you wish you had
end

Then /^save file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I see (\w+)$/ do |file_name|
  pending # express the regexp above with the code you wish you had
end

When /^I load routes$/ do 
  # routes is loaded when rails application loads, but i will load matcher for that
  self.extend(Lolita::Test::Matchers)
 # RSpec::Matchers.send(:include,Lolita::Test::Matchers)
end

Then /^I have (get|post|delete|put) route (.+)$/ do |method,url|
  {method=>url}.should be_routable
end

Given /^byte converter$/ do
  @converter=Lolita::Support::Bytes
end

When /^I humanize "([^"]*)"$/ do |size|
  @converter=@converter.new(eval(size))
end

Then /^I should get "([^"]*)" and "([^"]*)"$/ do |unit, limit|
  @converter.unit.should == unit
  @converter.value.should == limit.to_f
end
