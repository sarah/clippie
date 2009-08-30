module Clippie
  class Cucumber
    APP_ROOT = "."
    def self.define_steps(steps)
      file = File.open(File.join(APP_ROOT, "clippie_steps.rb"), "a+")
      file.write(steps + "\n\n" )
      file.close
    end
  end
end