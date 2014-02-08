module AdminManagement
  class ApplicationController < AdminManagement.BaseControllerClass
    include SessionsHelper
    helper 'admin_management/sessions'
  end
end
