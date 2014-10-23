$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_reset_password/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_reset_password"
  s.version     = RailsAdminResetPassword::VERSION
  s.authors     = ["Peter O'Sullivan", "Dave Burt"]
  s.email       = ["peter.osullivan@allori.edu.au", "dave.burt@allori.edu.au"]
  s.homepage    = "http://bitbucket.org/allori/rails_admin_reset_password"
  s.summary     = "Reset Password custom action for RailsAdmin"
  s.description = "Reset Password custom action for RailsAdmin"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails_admin"
end
