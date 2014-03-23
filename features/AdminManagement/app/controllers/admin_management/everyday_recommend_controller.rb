require_dependency "admin_management/application_controller"

module AdminManagement
  class EverydayRecommendController < ApplicationController

    def index

      @all_shop_logos = SellerManagement::EverydayRecommend.fetch_all_logos

    end

    def recommend_update

      params["data"].values.each do |recommend|
        SellerManagement::EverydayRecommend.update_recommend_status recommend
      end

      render :text=>"ok"

    end

  end
end
