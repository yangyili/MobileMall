module SellerManagement
  class EverydayRecommend < ActiveRecord::Base
    attr_accessible :seller_id, :image, :url, :is_display
    mount_uploader :image, ImageUploader
  end
end
