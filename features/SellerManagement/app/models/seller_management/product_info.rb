module SellerManagement
  class ProductInfo < ActiveRecord::Base
    attr_accessible :seller_id, :category, :name, :price, :image, :url, :describe
    mount_uploader :image, ImageUploader

    def self.save_new_product_to_database product_info, user_id
      if product_info[:image].present?
        uploader = ImageUploader.new
        uploader.store!(product_info[:image])
        create(seller_id:user_id,
               category:product_info[:category],
               name:product_info[:name],
               price:product_info[:price],
               describe:product_info[:describe],
               url:uploader.url)
      end
    end

  end
end
