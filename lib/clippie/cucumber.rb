module Clippie
  class Cucumber
    STEP_DEFINITIONS_ROOT = "."
    def self.define_steps(steps)
      file = File.open(File.join(STEP_DEFINITIONS_ROOT, "clippie_steps.rb"), "a+")
      file.write(steps + "\n\n" )
      file.close
    end
  end
end

if respond_to?(:After)
  After do |scenario|
    step_definitions = Cucumber::Cli::Main.step_mother.steps(:undefined).map {|step|
      multiline_arg_class = step.multiline_arg.nil? ? nil : step.multiline_arg.class
      Cucumber::StepDefinition.snippet_text(step.keyword, step.name, multiline_arg_class)
      }
    Clippie::Cucumber.define_steps(step_definitions.join("\n\n"))
  end
end