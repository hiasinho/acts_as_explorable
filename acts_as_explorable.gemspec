$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_explorable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_explorable"
  s.version     = ActsAsExplorable::VERSION
  s.authors     = ["Mathias Schneider"]
  s.email       = ["mathias@hiasinho.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActsAsExplorable."
  s.description = "TODO: Description of ActsAsExplorable."
  s.license     = "MIT"

  # s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "rspec"
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "sqlite3"
end
