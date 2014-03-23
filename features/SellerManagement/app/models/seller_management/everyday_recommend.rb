module SellerManagement
  class EverydayRecommend < ActiveRecord::Base
    attr_accessible :seller_id, :image, :url, :is_display
    mount_uploader :image, ImageUploader

    def self.save_new_logo_to_database shop_logo, user_id
      if shop_logo[:image].present?
        uploader = ImageUploader.new
        uploader.store!(shop_logo[:image])
        create(seller_id:user_id,
               url:uploader.url)
      end
    end

    def self.fetch_all_logos
      all.group_by{|shop| shop.seller_id}
    end

    def self.update_recommend_status recommend
      find(recommend["id"]). update_attribute(:is_display, recommend["is_display"])
    end

  end
end
