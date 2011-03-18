require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lolita::Multimedia::File do
  
  let(:dbi){
    Lolita::DBI::Base.new(Post)
  }
  let(:normal_file){
      Lolita::Multimedia::File.new(:asset=>File.open(Support.get_file("normal_file.txt")))
  }
  let(:tab){
    Lolita::Configuration::FileTab.new(dbi)
  }

  context "upload" do
      it "should be allowed" do
        file=Lolita::Multimedia::File.create(:asset=>File.open(Support.get_file("large_file.txt")))
        file.asset.current_path.should match(/large_file\.txt$/)
      end
  end

  context "configuration" do
    it "should get from parent model lolita file tab" do
      post=Factory.create(:post)
      file_tab=tab
      file_tab.maxfilesize=5
      Post.lolita.tabs << file_tab
      normal_file.fileable=post
      normal_file.save
      debugger
      normal_file.errors[:asset].should == ["file too big (max #{5.0} bytes)"]
    end
  end
end