require_dependency "admin_management/application_controller"

module AdminManagement
  class SessionsController < ApplicationController

    def new
      redirect_by_role current_user if signed_in?
    end

    def create
      user = AdminManagementUser.authenticate(params[:session][:email], params[:session][:password])
      if user.nil?
        redirect_to signin_path
      else
        sign_in user
        redirect_by_role user
      end

    end

    def destroy
      sign_out
      redirect_to signin_path
    end


    private

    def redirect_by_role user
      if user.admin=="admin"
        redirect_to admin_management_users_path
      elsif user.admin=="seller"
        redirect_to "/"
      else
        redirect_to AdminManagement.signin_redirect_path
      end

    end

  end
end
