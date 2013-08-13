$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_robots/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_robots"
  s.version     = BootstrapRobots::VERSION
  s.authors     = ["Franz Wilding"]
  s.email       = ["franz@2robots.at"]
  s.homepage    = "http://2robots.at"
  s.summary     = "Bootstrap rails_admin"
  s.description = "Bootstrap rails_admin with user, roles, history, auth, i18n"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
