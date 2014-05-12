module CustomerManagement
  class Order < ActiveRecord::Base
    attr_accessible :product_id, :status, :customer_id, :count

    def self.create_new_order user_id, order

      create(customer_id:user_id,product_id:order["product_id"],count:order["count"],status:"未付款")

    end

    def self.fetch_customer_orders user_id

      where(customer_id:user_id)

    end

    def self.fetch_seller_orders_by product_id

      where(product_id:product_id)

    end

    def self.delete_order_by order_id

      delete(order_id)

    end

    def self.pay_for_order_by order_id

      order = find(order_id)
      order.update_attribute(:status, "已付款")

    end

    def self.confirm_receipt_by order_id

      order = find(order_id)
      order.update_attribute(:status, "已完成")

    end

    def self.confirm_send_product_by order_id

      order = find(order_id)
      order.update_attribute(:status, "已发货")

    end

  end
end
