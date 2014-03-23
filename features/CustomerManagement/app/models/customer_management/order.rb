module CustomerManagement
  class Order < ActiveRecord::Base
    attr_accessible :product_id, :status, :customer_id, :count

    def self.create_new_order user_id, order

      create(customer_id:user_id,product_id:order["product_id"],count:order["count"],status:"未完成")

    end

    def self.fetch_customer_orders user_id

      where(customer_id:user_id)

    end

    def self.delete_order_by order_id

      delete(order_id)

    end

  end
end
