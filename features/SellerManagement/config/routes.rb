SellerManagement::Engine.routes.draw do
  resources :shop

  get "index" ,to:"shop#index"

end
