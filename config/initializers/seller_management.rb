SellerManagementDependencies.BaseControllerClass = Class.new(ActionController::Base) do
  include CurrentUserHelper
  layout 'application'
  before_action :init_assets

  private
  def init_assets
    @custom_css = @custom_js = 'seller_management/application'
  end
end




