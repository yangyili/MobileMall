CustomerManagement::Engine.routes.draw do
  resources :information

  get "index" ,to:"information#index"
end
