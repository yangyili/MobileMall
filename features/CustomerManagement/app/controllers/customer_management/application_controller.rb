module CustomerManagement
  class ApplicationController < CustomerManagementDependencies.BaseControllerClass
    #before_filter :non_admin_authenticate
  end
end
