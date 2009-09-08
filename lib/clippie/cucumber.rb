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
      config_options = ConfigOptions.new
      config_options.instance_eval &block
      its_okay_clippie if config_options.its_okay_clippie_set
      step_definitions config_options.step_definitions_path
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

    class ConfigOptions
      attr_reader :its_okay_clippie_set, :step_definitions_path
      def initialize
        @its_okay_clippie_set = false
        @step_definitions_path = "./features/step_definitions"
      end
      def step_definitions(path)
        @step_definitions_path = path
      end
      def its_okay_clippie
        @its_okay_clippie = true
      end
    end

    class UndefinedSteps
      def self.<<(step)
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

