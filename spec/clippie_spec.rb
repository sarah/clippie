require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Clippie::Cucumber do
  context ".define_steps" do
    before(:each) do
      File.stub!(:exists?).and_return false
      @file = mock("file")
      File.stub!(:open).and_return @file
      @file.stub!(:write)
      @file.stub!(:close)
    end
    it "generates file" do
      File.should_receive(:open).with(File.join(EXAMPLE_APP_ROOT, "clippie_steps.rb"), "a+")
      Clippie::Cucumber.define_steps "dkdk"
    end
    it "writes the steps to the file" do
      step_definitions = "IAmAnUndefinedStep"
      @file.should_receive(:write).with(step_definitions + "\n\n")
      Clippie::Cucumber.define_steps step_definitions
    end
    it "closes the file" do
      @file.should_receive :close
      Clippie::Cucumber.define_steps ""
    end
  end
end
