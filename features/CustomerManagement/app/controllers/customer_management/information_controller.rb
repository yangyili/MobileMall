require_dependency "customer_management/application_controller"

module CustomerManagement
  class InformationController < ApplicationController
    def index

      @recommend_logos = SellerManagement::EverydayRecommend.fetch_display_logos

    end

    def products_show

      @product_infos = SellerManagement::ProductInfo.fetch_product_infos_by params[:category]

    end

    def product_detail

      @product = SellerManagement::ProductInfo.find_product_by params["product_id"]

    end


  end
end
