module Clippie
  class Cucumber
    
    def self.step_definitions_root=(path)
      @step_definitions_root = path
    end

    def self.step_definitions_root
      @step_definitions_root ||= "./features/step_definitions"
    end
    
    def self.define_steps(steps)
      file = File.open(File.join(step_definitions_root, "clippie_steps.rb"), "a+")
      file.write(steps + "\n\n" )
      file.close
    end
    
    def self.configure &block
      self.instance_eval &block
    end
    
    def self.step_definitions(path)
      self.step_definitions_root = path
    end
  end
end

if respond_to?(:After)
  After do |scenario|
    step_definitions = Cucumber::Cli::Main.step_mother.steps(:undefined).map {|step|
      multiline_arg_class = step.multiline_arg.nil? ? nil : step.multiline_arg.class
        Cucumber::Cli::Main.step_mother.snippet_text(step.keyword, step.name, multiline_arg_class)
      }
    Clippie::Cucumber.define_steps(step_definitions.join("\n\n"))
  end
end