# This migration comes from seller_management (originally 20140305221238)
class CreateSellerManagementProductInfos < ActiveRecord::Migration
  def change
    create_table :seller_management_product_infos do |t|
      t.integer :seller_id
      t.string :category
      t.string :name
      t.integer :price
      t.string :describe

      t.timestamps
    end
  end
end
