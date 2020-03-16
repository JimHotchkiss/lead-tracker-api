Rails.application.routes.draw do

  # sessions route
  post "api/v1/login", to: "sessions#create"
  namespace :api do
    namespace :v1 do
      resources :leads
      resources :contacts
      resources :users
    end
  end
 end
