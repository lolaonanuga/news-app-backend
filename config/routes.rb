
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :stories, only: [:index, :update, :create]
        resources :comments, only: [:index, :show, :create]
      end
    end
  end


