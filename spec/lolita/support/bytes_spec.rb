require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')


 describe Lolita::Support::Bytes do
    let(:klass){Lolita::Support::Bytes}

    it "should recognize bytes" do
      conv=klass.new(512)
      conv.unit.should == "bytes"
      conv.value.should == 512.0
    end

    it "should recognize kilobytes" do
      conv=klass.new(1024+6)
      conv.unit.should == "kilobytes"
      conv.value.should == 1.01
    end

    it "should recognize megabytes" do
      conv=klass.new(1024**2)
      conv.unit.should == "megabyte"
      conv.value.should == 1.0
    end

    it "should recognize gigabytes" do
      conv=klass.new(1024**3+1024**2*10)
      conv.unit.should == "gigabytes"
      conv.value.should == 1.01
    end

    it "should take next unit when rounding move to next limit" do
      conv=klass.new(1024**2-1)
      conv.value.should == 1.0
      conv.unit.should == "megabyte"
    end
  end