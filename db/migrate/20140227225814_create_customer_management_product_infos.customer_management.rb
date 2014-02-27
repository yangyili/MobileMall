# This migration comes from customer_management (originally 20140227225651)
class CreateCustomerManagementProductInfos < ActiveRecord::Migration
  def change
    create_table :customer_management_product_infos do |t|
      t.string :seller_id
      t.string :category
      t.string :name
      t.string :price
      t.string :describe

      t.timestamps
    end
  end
end
