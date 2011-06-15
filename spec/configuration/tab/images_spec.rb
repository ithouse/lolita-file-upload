require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Lolita::Configuration::Tab::Images do

  let(:dbi){Lolita::DBI::Base.new(News)}
  let(:klass){Lolita::Configuration::Tab::Images}

  it "should create new tab " do
    klass.new(dbi,:images,:main_image)
  end

  it "should have tab_field for image tab" do
    News.lolita.tabs.first.tab_field.should == :main_image
  end

end