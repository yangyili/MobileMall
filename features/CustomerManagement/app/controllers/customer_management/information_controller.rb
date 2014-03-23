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

    def create_order
      Order.create_new_order current_user_id, params["new_order"]

      redirect_to :action=>"fetch_customer_orders"
    end

    def fetch_customer_orders

      @customer_orders = Order.fetch_customer_orders current_user_id

    end

    def delete_order

      Order.delete_order_by params['order_id']

      redirect_to :action=>"fetch_customer_orders"

    end

  end
end
