CustomerManagement::Engine.routes.draw do
  resources :information

  get "index", to:"information#index"

  get "products_show", to:"information#products_show"

  get "product_detail", to:"information#product_detail"

  post "order", to:"information#create_order"

  get "customer_orders", to:"information#fetch_customer_orders"

  post "delete_order", to:"information#delete_order"

end
