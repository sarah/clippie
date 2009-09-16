# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{clippie}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["sarah", "coreyhaines"]
  s.date = %q{2009-09-15}
  s.description = %q{helpful assistant to generate plumbing code}
  s.email = %q{sarahg.gray@gmail.com;coreyhaines@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "clippie.gemspec",
     "cucumber.yml",
     "example_app/features/step_definitions/.README",
     "features/generate_cucumber_steps.feature",
     "features/step_definitions/cucumber_step_generation_steps.rb",
     "features/support/env.rb",
     "lib/clippie/cucumber.rb",
     "lib/clippie/cucumber/cucumber.rb",
     "spec/clippie_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/sarah/clippie}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{helpful assistant to generate plumbing code}
  s.test_files = [
    "spec/clippie_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
