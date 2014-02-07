$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin_management/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin_management"
  s.version     = AdminManagement::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AdminManagement."
  s.description = "TODO: Description of AdminManagement."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"

  s.add_dependency 'haml', '~> 3.1.7'

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'haml-rails', '~> 0.3.5'

  s.add_development_dependency "rspec-rails"

  s.add_development_dependency "factory_girl_rails"

  s.add_dependency "protected_attributes"

  s.add_dependency 'will_paginate-bootstrap'

  s.add_dependency 'will_paginate', '~> 3.0'

end
