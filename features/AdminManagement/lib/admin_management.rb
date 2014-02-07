require "admin_management/engine"

module AdminManagement

  mattr_accessor :BaseControllerClass
  #mattr_accessor :signin_redirect_path
end
AdminManagement.BaseControllerClass = ActionController::Base
