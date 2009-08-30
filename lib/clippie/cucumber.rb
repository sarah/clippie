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