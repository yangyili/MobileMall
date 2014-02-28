SellerManagement::Engine.routes.draw do
  resources :my_shop

  get "index" ,to:"my_shop#index"

end
