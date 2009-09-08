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
    class UndefinedSteps
      def self.add(step)
        (@undefined_steps ||= []) << step
      end
      def self.steps
        @undefined_steps
      end
    end
  end
  def self.says(something)
    puts "Clippie Says: #{something}\n"
  end
end

if respond_to?(:After)
  After do |scenario|
    Cucumber::Cli::Main.step_mother.steps(:undefined).each {|step| Clippie::Cucumber::UndefinedSteps.add(step)}
  end
end

at_exit do
  step_definitions = Clippie::Cucumber::UndefinedSteps.steps.map {|step|
    multiline_arg_class = step.multiline_arg.nil? ? nil : step.multiline_arg.class
      Cucumber::Cli::Main.step_mother.snippet_text(step.keyword, step.name, multiline_arg_class)
    }
  Clippie.says "I noticed you have some undefined steps"
  Clippie.says "Would you like me to create them for you [Yn]?"
  input = gets
  if(input =~ /^n/)
    Clippie.says "Awwww...Okay. :("
  else
    Clippie.says "Yay! I'm creating them for you now."
    Clippie::Cucumber.define_steps(step_definitions.join("\n\n"))
  end
end