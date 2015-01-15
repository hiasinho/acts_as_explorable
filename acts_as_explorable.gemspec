$:.push File.expand_path("../lib", __FILE__)
require "acts_as_explorable/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_explorable"
  s.version     = ActsAsExplorable::VERSION
  s.authors     = ["Mathias Schneider"]
  s.email       = ["mathias@hiasinho.com"]
  s.homepage    = "https://github.com/hiasinho/acts_as_explorable"
  s.summary     = "Adds GitHub-like search function to your models"
  s.description = "Adds GitHub-like search function to your models"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "sqlite3"
end
