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

  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths         = ["lib"]
  s.required_ruby_version = '>= 1.9.3'

  # s.add_development_dependency "byebug"
  s.add_development_dependency "rspec"
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "watchr"
end
