Rails.application.routes.draw do

  # sessions route


  get "api/v1/current_user", to: "api/v1/sessions#get_current_user"
  post "api/v1/login", to: "api/v1/sessions#create"
  delete "api/v1/logout", to: "api/v1/sessions#destroy"
  namespace :api do
    namespace :v1 do
      resources :leads
      resources :contacts
      resources :users
    end
  end
 end
