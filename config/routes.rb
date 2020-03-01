Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :leads 
      resources :contacts
      resources :users 
    end 
  end 
  
  # namespace :api do 
  #   namespace :v1 do 
  #     resources :contacts do 
  #       resources :leads 
  #     end 
  #   end 
  # end 

  #   namespace :api do
  #     namespace :v1 do 
  #       resources :users do 
  #         resources :leads 
  #       end 
  #     end 
  #   end 
 end
