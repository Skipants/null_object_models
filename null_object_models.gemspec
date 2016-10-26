$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "null_object_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "null_object_models"
  s.version     = NullObjectModels::VERSION
  s.authors     = ["Andrew Szczepanski"]
  s.email       = ["andrew.szczepanski@thescore.com"]
  s.homepage    = "https://www.github.com/skipants/null_object_models"
  s.summary     = "ActiveRecord extension for handling dangling records with the null object pattern"
  s.description = <<~DESCRIPTION
    Null Object Models is a gem that provides finder method(s) extensions to ActiveRecord::Base
    objects. These finder methods will return either default or defined null objects if an object
    is not found with the given ID(s). This is very useful for preventing nil errors.

    I recommend using this gem if you have dangling records and have yet to implement some sort
    of soft destroy implementation.
  DESCRIPTION
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 5.0"

  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pg"
  s.add_development_dependency "pry-byebug"
end
