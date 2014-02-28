#encoding=UTF-8
module CurrentUserHelper
  def current_user
    #session[:current_user]
    if session[:user_id].nil?
      return nil
    else
      AdminManagement::AdminManagementUser.find(session[:user_id])
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def is_admin?
    signed_in? && current_user.admin=="admin"
  end

  def is_seller?
    signed_in? && current_user.admin == "seller"
  end

  def current_user_id
    session[:user_id] || nil
  end

  def deny_access
    redirect_to '/', :notice => "Please sign in to access this page."
  end

  def non_admin_authenticate
    deny_access unless signed_in? && (not current_user.admin=="admin")
  end

  def admin_authenticate
    deny_access unless is_admin?
  end

end