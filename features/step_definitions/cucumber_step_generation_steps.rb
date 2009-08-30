Given /^the following undefined step$/ do |string|
  @undefined_step = string
end

When /^I create the undefined steps$/ do
  Clippie::Cucumber.define_steps @undefined_step
end

Then /^the file "([^\"]*)" should exist in example app$/ do |filename|
  File.exists?(File.join(Clippie::Cucumber::APP_ROOT, filename)).should be_true
end

Then /^the file "([^\"]*)" should contain the undefined step$/ do |filename|
  file = File.open(File.join(Clippie::Cucumber::APP_ROOT, filename), "r")
  contents = ""
  while line = file.gets
    contents += line
  end
  contents.should include(@undefined_step)
  
end
