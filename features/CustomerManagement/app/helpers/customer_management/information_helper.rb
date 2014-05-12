module CustomerManagement
  module InformationHelper

    def fetch_product_category category_name
      return "服装" if category_name == 'clothes'

      return "鞋子" if category_name == 'shoes'

      return "包包" if category_name == 'bags'

      return "首饰" if category_name == 'jewelry'

      return "未定义"

    end

    def fetch_product_info_by product_id

      SellerManagement::ProductInfo.find_product_by product_id

    end

  end
end
