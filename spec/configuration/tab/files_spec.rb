require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Lolita::Configuration::Tab::Files do

  let(:dbi){Lolita::DBI::Base.new(Post)}
  let(:tab){Lolita::Configuration::Tab::Files.new(dbi)}

  it "should create new file tab" do
    Lolita::Configuration::Tab::Files.new(dbi).type.should == :files
  end

  describe "extensions" do

    it "should return empty array for new tab" do
      tab.filters.should == []
    end 

    it "all can be assigned" do
      tab.filters=["pdf","xls"]
      tab.filters.should == ["pdf", "xls"]
    end

    it "should allow to add new one" do
      tab.filters("Image","pdf")
      tab.filters.should == [{:title=>"Image",:extensions=>"pdf"}]
    end
  end

  describe "maximum file size" do
    it "should be changable" do
      tab.maxfilesize=2048
      tab.maxfilesize.should == 2048
      tab.maxfilesize(1024)
      tab.maxfilesize.should == 1024
    end
  end 
end