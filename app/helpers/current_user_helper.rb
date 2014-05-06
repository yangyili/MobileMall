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

  def is_customer?
    signed_in? && current_user.admin == "customer"
  end

  def current_user_id
    session[:user_id] || nil
  end

  def deny_access
    redirect_to '/', :notice => "Please sign in to access this page."
  end

  def non_admin_authenticate
    deny_access unless signed_in? && (not current_user.admin == "admin")
  end

  def non_seller_authenticate
    deny_access unless signed_in? && (not current_user.admin == "seller")
  end

  def non_customer_authenticate
    deny_access unless signed_in? && (not current_user.admin == "customer")
  end

  def admin_authenticate
    deny_access unless is_admin?
  end

  def seller_authenticate
    deny_access unless is_seller?
  end

  def customer_authenticate
    deny_access unless is_customer?
  end


  def logo_url
    return '/' if current_user.blank?

    return '/admin_management_users' if current_user.admin == 'admin'

    return '/seller_management/index' if current_user.admin == 'seller'

    return '/customer_management/index' if current_user.admin == 'customer'
  end
end