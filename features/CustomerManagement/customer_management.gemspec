$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "customer_management/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "customer_management"
  s.version     = CustomerManagement::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CustomerManagement."
  s.description = "TODO: Description of CustomerManagement."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'will_paginate-bootstrap'

  s.add_development_dependency 'will_paginate', '~> 3.0'

  s.add_development_dependency "rspec-rails"

  s.add_development_dependency "factory_girl_rails"

end
