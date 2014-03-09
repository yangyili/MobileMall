SellerManagement::Engine.routes.draw do
  resources :shop

  get "index", to:"shop#index"

  post "index", to:"shop#create_product"

end
