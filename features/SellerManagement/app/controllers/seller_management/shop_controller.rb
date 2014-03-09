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

    def edit_product
      product = ProductInfo.find_by(id:params[:product][:id])
      product.name = params[:product][:name]
      product.price = params[:product][:price]
      product.describe = params[:product][:describe]
      product.save

      redirect_to :action=>"index"
    end

    def delete_product
      product = ProductInfo.find_by(id:params[:id])
      product.delete

      redirect_to :action => 'index'
    end

  end
end
