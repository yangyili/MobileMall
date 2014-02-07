require "customer_management/engine"

module CustomerManagementDependencies
  mattr_accessor :BaseControllerClass
end

CustomerManagementDependencies.BaseControllerClass = Class.new(ActionController::Base)