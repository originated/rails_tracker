$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tracker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tracker"
  s.version     = Tracker::VERSION
  s.authors     = ["Mike Cifani"]
  s.email       = ["mcifani@gmail.com"]
  s.homepage    = "http://github.com/mcifani/active_progress"
  s.summary     = "A simple way to allow your end users to follow development progress"
  s.description = "A simple way to allow your end users to follow development progress"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  # s.add_dependency "rails", "~> 3.2.14"
  # s.add_dependency "jquery-rails"
  # s.add_development_dependency "sqlite3"

  s.add_dependency "github_api"
end
