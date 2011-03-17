require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lolita::Configuration::FileTab do

  let(:dbi){Lolita::DBI::Base.new(Post)}

  it "should create new file tab" do
    Lolita::Configuration::FileTab.new(dbi).type.should == :file
  end

  describe "extensions" do
    let(:tab){Lolita::Configuration::FileTab.new(dbi)}

    it "should return empty array for new tab" do
      tab.extensions.should == []
    end 

    it "all can be assigned" do
      tab.extensions=["pdf","xls"]
      tab.extensions.should == ["pdf", "xls"]
    end

    it "add new one" do
      tab.extension("pdf")
      tab.extensions.should == ["pdf"]
    end
  end
end