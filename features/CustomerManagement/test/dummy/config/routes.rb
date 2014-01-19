Rails.application.routes.draw do

  mount CustomerManagement::Engine => "/customer_management"
end
