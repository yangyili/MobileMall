class CreateCustomerManagementEverydayRecommends < ActiveRecord::Migration
  def change
    create_table :customer_management_everyday_recommends do |t|
      t.string :seller_id
      t.string :recommend_image
      t.string :is_display

      t.timestamps
    end
  end
end
