Rails.application.routes.draw do
  resources :flags
  resources :memberships
  namespace :api do
    namespace :v1 do
      resources :user_tasks, only: [:index, :create, :update, :destroy]
      resources :functions, only: [:index]
      resources :users, only: [:index]
      resources :memberships, only: [:create, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      resources :projects, only: [:index, :show, :create, :update, :destroy]
      resources :flags, only: [:create, :destroy]

      post "/signup", to: "users#create"
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end  
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
