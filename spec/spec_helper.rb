$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'spec'
require 'spec/autorun'
require 'clippie/cucumber'
EXAMPLE_APP_ROOT = File.join(File.dirname(__FILE__), '..', 'example_app', 'features','step_definitions')
Clippie::Cucumber::STEP_DEFINITIONS_ROOT = EXAMPLE_APP_ROOT

Spec::Runner.configure do |config|
  
end
