AdminManagement.signin_redirect_path = '/customer_management/index'
AdminManagement.BaseControllerClass = Class.new(ActionController::Base) do

  layout 'application'
  before_action :init_assets

  private
  def init_assets
    @custom_css = @custom_js = 'admin_management/application'
  end
end




