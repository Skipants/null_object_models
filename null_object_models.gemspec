$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "null_object_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "null_object_models"
  s.version     = NullObjectModels::VERSION
  s.authors     = ["Andrew Szczepanski"]
  s.email       = ["andrew.szczepanski@thescore.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of NullObjectModels."
  s.description = "TODO: Description of NullObjectModels."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pg"
  s.add_development_dependency "pry-byebug"
end
