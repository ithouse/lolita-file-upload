require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lolita::Upload::File do
  
  let(:dbi){
    Lolita::DBI::Base.new(Post)
  }
  let(:normal_file){
      Lolita::Upload::File.new(:asset=>File.open(Support.get_file("normal_file.txt")))
  }
  let(:tab){
    Lolita::Configuration::Tab::Files.new(dbi)
  }

  context "upload" do
      it "should be allowed" do
        file=Lolita::Upload::File.create(:asset=>File.open(Support.get_file("large_file.txt")))
        file.asset.current_path.should match(/large_file\.txt$/)
      end
  end

end
