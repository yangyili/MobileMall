SellerManagement::Engine.routes.draw do
  resources :shop

  get "index", to:"shop#index"

  get "apply_recommend", to:"shop#apply_recommend"

  post "shop_logo", to:"shop#create_shop_logo"

  post "index", to:"shop#create_product"

  post "edit_product" , to:"shop#edit_product"

  match "delete_product/:id", to:"shop#delete_product" , :via=>:post

  get "seller_orders", to:"shop#fetch_seller_orders"

  get "seller_order_detail/:product_id", to:"shop#seller_order_detail"

  post "confirm_send_product", to:"shop#confirm_send_product"


end
