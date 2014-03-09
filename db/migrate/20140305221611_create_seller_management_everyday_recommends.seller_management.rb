# This migration comes from seller_management (originally 20140305221027)
class CreateSellerManagementEverydayRecommends < ActiveRecord::Migration
  def change
    create_table :seller_management_everyday_recommends do |t|
      t.integer :seller_id
      t.string :image
      t.string :url
      t.boolean :is_display, :default => false

      t.timestamps
    end
  end
end
