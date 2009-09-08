require 'clippie/cucumber'
if respond_to?(:After)
  def create_steps(steps)
    return if steps.nil?
    step_definitions = steps.map {|step|
      multiline_arg_class = step.multiline_arg.nil? ? nil : step.multiline_arg.class
        Cucumber::Cli::Main.step_mother.snippet_text(step.keyword, step.name, multiline_arg_class)
      }
    Clippie.says "I noticed you have some undefined steps."
    puts steps.map {|step| "\t\"#{step.keyword} #{step.name}\""}.join("\n")
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
    Cucumber::Cli::Main.step_mother.steps(:undefined).each {|step| Clippie::Cucumber::UndefinedSteps << step}
    create_steps Clippie::Cucumber::UndefinedSteps.steps if Clippie::Cucumber.is_overly_helpful?
  end

  at_exit do
    create_steps Clippie::Cucumber::UndefinedSteps.steps unless Clippie::Cucumber.is_overly_helpful?
  end
end
