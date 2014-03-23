CustomerManagement::Engine.routes.draw do
  resources :information

  get "index", to:"information#index"

  get "products_show", to:"information#products_show"

  get "product_detail", to:"information#product_detail"

end
