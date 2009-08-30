module Clippie
  class Cucumber
    APP_ROOT = "."
    def self.define_steps(steps)
      File.new(File.join(APP_ROOT, "clippie_steps.rb"), "w+")
      
    end
  end
end