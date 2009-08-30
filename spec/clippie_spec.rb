require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Clippie::Cucumber do
  context ".define_steps" do
    context "file does not exist" do
      before(:each) do
        File.stub!(:exists?).and_return false
      end
      it "generates file" do
        File.should_receive(:new).with(File.join(EXAMPLE_APP_ROOT, "clippie_steps.rb"), "w+")
        Clippie::Cucumber.define_steps "dkdk"
      end
    end
  end
end
