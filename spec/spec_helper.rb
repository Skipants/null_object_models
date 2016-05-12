ENV["RAILS_ENV"] ||= "test"

require 'pry-byebug'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

require 'factory_girl_rails'
require 'support/factory_girl'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
