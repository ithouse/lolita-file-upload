require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FileUploader do

  let(:uploader){FileUploader.new}

  it "should upload file" do
    lambda{
      uploader.store!(File.open(Support.get_file("large_file.txt")))
    }.should_not raise_error
  end
end