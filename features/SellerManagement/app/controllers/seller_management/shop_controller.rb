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

    def apply_recommend

    @all_logos = EverydayRecommend.where(seller_id:current_user_id).paginate(:page => params[:page] || 1, :per_page => 10)

    end

    def create_shop_logo
      EverydayRecommend.save_new_logo_to_database params[:shop_logo],current_user_id

      redirect_to :action=>"apply_recommend"
    end

    def fetch_seller_orders
      @seller_orders=[]
      all_products = ProductInfo.fetch_all_products_by current_user_id
      all_products.each do |product|

        @seller_orders.push({
            product_info: product,
            orders_info: CustomerManagement::Order.fetch_seller_orders_by(product.id).group_by{|order| order.status}
                           })
      end
      @seller_orders
    end

    def seller_order_detail

      @products = CustomerManagement::Order.fetch_seller_orders_by(params[:product_id]).group_by{|order| order.status}

    end

    def confirm_send_product

      CustomerManagement::Order.confirm_send_product_by params['order_id']

      render text:"ok"

    end

  end
end
