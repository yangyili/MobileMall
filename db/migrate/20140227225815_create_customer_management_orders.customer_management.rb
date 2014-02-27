# This migration comes from customer_management (originally 20140227225749)
class CreateCustomerManagementOrders < ActiveRecord::Migration
  def change
    create_table :customer_management_orders do |t|
      t.string :product_id
      t.string :status
      t.string :customer_id
      t.string :count

      t.timestamps
    end
  end
end
