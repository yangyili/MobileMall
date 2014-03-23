AdminManagement::Engine.routes.draw do
  resources :admin_management_users
  resources :sessions

  resources :everyday_recommend

  post "everyday_recommend/recommend" =>"everyday_recommend#recommend_update"

  root :to => 'sessions#new'
  get "/signin" => 'sessions#new'
  get "/signout" => 'sessions#destroy'
  match "/signup" => 'register#new', :via => :get, :as => 'signup'
  match "/signup" => 'register#create', :via => :post

end
