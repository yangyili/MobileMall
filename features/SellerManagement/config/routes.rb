SellerManagement::Engine.routes.draw do
  resources :shop

  get "index", to:"shop#index"

  post "index", to:"shop#create_product"

  post "edit_product" , to:"shop#edit_product"

  match "delete_product/:id" ,to:"shop#delete_product" , :via=>:post

end
