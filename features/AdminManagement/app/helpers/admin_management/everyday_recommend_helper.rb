module AdminManagement
  module EverydayRecommendHelper

    def fetch_seller_name seller_id
      AdminManagement::AdminManagementUser.fetch_user_name seller_id
    end

  end
end
