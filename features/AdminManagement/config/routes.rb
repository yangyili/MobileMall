AdminManagement::Engine.routes.draw do
  resources :admin_management_users
  root :to => 'admin_management_users#index'

end
