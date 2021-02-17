Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_tasks, only: [:index, :create, :update, :destroy]
      resources :functions, only: [:index]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      resources :projects, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:create]
    end  
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
