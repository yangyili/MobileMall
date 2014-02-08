AdminManagement::Engine.routes.draw do
  resources :admin_management_users
  resources :sessions

  root :to => 'sessions#new'

end
