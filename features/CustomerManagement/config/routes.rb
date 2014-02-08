CustomerManagement::Engine.routes.draw do
  resources :show_products

  get "index" ,to:"show_products#index"

end
