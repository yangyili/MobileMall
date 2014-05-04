AdminManagement::Engine.routes.draw do
  resources :admin_management_users
  resources :sessions

  resources :everyday_recommend

  post "everyday_recommend/recommend" =>"everyday_recommend#recommend_update"

  #root :to => 'sessions#new'
  get "/signin" => 'sessions#new'
  get "/signout" => 'sessions#destroy'
  match "/signup" => 'register#new', :via => :get, :as => 'signup'
  match "/signup" => 'register#create', :via => :post


  root :to => 'login_and_register#index'

  get "/index" => 'login_and_register#index'
  get '/about_us' => 'login_and_register#about_us'
  get '/login' => 'login_and_register#login'
  get '/register' => 'login_and_register#register'
  get '/logout' => 'login_and_register#destroy_session'
  get '/register_phone/:open_id' => 'login_and_register#phone_register'

  scope "/user" do
    get '/confirm' => 'login_and_register#confirm'
    post '/user_inspect' => 'login_and_register#inspect_user'
    post '/create' => 'login_and_register#user_register'
    post '/user_login' => 'login_and_register#user_login'
  end

end
