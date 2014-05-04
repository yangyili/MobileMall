require_dependency "admin_management/application_controller"

module AdminManagement
  class LoginAndRegisterController < ApplicationController
    layout "login_and_register"

    def index

    end

    def about_us

    end

    def login

    end

    def user_register
      user = AdminManagementUser.new(params[:user])

      if user.save
        session[:user_id] = user.id
        render :json => {:tip=>'save_user', :url=>'/customer_management/index'}
      else
        render :json => {:tip=>'not_save', :url=>'/register'}
      end

    end

    def confirm
      render :text => AdminManagementUser.confirm_can_use?(params[:name],params[:content]) ? 'ok' : 'no'
    end

    def inspect_user
      user = AdminManagementUser.find_by(email:params['email'])

      render :text=> user.blank? ? 'email_wrong':(user.password == params[:password] ? 'right':'password_wrong')
    end

    def user_login
      user = AdminManagementUser.find_by(email:params['email'],password:params['password'])

      if user.present?
        session[:user_id] = user.id
        if user.admin == 'customer'
          render :json => {:tip=>'login_success', :url=>'customer_management/index'}
        end

        if user.admin == 'seller'
          render :json => {:tip=>'login_success', :url=>'seller_management/index'}
        end

        if user.admin == 'admin'
          render :json => {:tip=>'login_success', :url=>'admin_management_users'}
        end
      else
        render :json => {:tip=>'login_failure', :url=>'/login'}
      end
    end

    def destroy_session
      session[:user_id] = nil
      redirect_to '/index'
    end

  end
end
