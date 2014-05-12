require "seller_management/engine"

module SellerManagementDependencies
  mattr_accessor :BaseControllerClass
end

SellerManagementDependencies.BaseControllerClass = Class.new(ActionController::Base)
