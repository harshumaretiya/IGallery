Rails.application.routes.draw do
  
  resources :meetings
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :albums do
    resources :photos
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "albums#index"
end
