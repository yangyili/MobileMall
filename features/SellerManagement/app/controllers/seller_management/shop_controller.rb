require_dependency "seller_management/application_controller"

module SellerManagement
  class ShopController < ApplicationController
    def index
      @products =  ProductInfo.where(seller_id:current_user_id).paginate(:page => params[:page], :per_page => 10)

    end

    def create_product

      ProductInfo.save_new_product_to_database params[:new_product],current_user_id

      redirect_to :action=>"index"
    end

  end
end
