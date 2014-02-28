require "admin_management/engine"

module AdminManagement
  mattr_accessor :BaseControllerClass
  mattr_accessor :customer_signin_redirect_path
  mattr_accessor :seller_signin_redirect_path
end
AdminManagement.BaseControllerClass = ActionController::Base
