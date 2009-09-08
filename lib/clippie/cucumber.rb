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

    def self.its_okay_clippie
      @its_okay_clippie = true
    end

    def self.is_overly_helpful?
      ! @its_okay_clippie
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
  def create_steps(steps, show_undefined_steps = false)
    step_definitions = steps.map {|step|
      multiline_arg_class = step.multiline_arg.nil? ? nil : step.multiline_arg.class
        Cucumber::Cli::Main.step_mother.snippet_text(step.keyword, step.name, multiline_arg_class)
      }
    Clippie.says "I noticed you have some undefined steps."
    if show_undefined_steps
      puts steps.map {|step| "\t\"#{step.keyword} #{step.name}\""}.join("\n")
    end
    Clippie.says "Would you like me to create them for you [Yn]?"
    input = gets
    if(input =~ /^n/)
      Clippie.says "Awwww...Okay. I'll stop now.  I'll just leave you alone. Paste them yourself."
    else
      Clippie.says "Yay! I'm creating them for you now."
      Clippie::Cucumber.define_steps(step_definitions.join("\n\n"))
    end
  end
  
  After do
    Cucumber::Cli::Main.step_mother.steps(:undefined).each {|step| Clippie::Cucumber::UndefinedSteps.add(step)}
    
    create_steps(Clippie::Cucumber::UndefinedSteps.steps, true) if Clippie::Cucumber.is_overly_helpful?
  end

  at_exit do
    create_steps(Clippie::Cucumber::UndefinedSteps.steps) unless Clippie::Cucumber.is_overly_helpful?
  end
end
