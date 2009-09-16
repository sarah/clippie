$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'clippie'

require 'spec/expectations'

EXAMPLE_APP_ROOT = File.join(File.dirname(__FILE__), '..', '..', 'example_app', 'features','step_definitions')

Clippie::Cucumber.configure do
  step_definitions EXAMPLE_APP_ROOT
end

CREATED_STEP_FILE = File.join(EXAMPLE_APP_ROOT, "clippie_steps.rb")

Before do
  File.delete(CREATED_STEP_FILE) if File.exists? CREATED_STEP_FILE
end

After do
  File.delete(CREATED_STEP_FILE) if File.exists? CREATED_STEP_FILE
end
