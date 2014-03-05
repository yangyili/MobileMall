# This migration comes from customer_management (originally 20140227225749)
class CreateCustomerManagementOrders < ActiveRecord::Migration
  def change
    create_table :customer_management_orders do |t|
      t.integer :product_id
      t.string :status
      t.integer :customer_id
      t.integer :count

      t.timestamps
    end
  end
end
