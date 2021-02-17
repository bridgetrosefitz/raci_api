Rails.application.routes.draw do
  # resources :user_tasks
  # resources :functions
  resources :tasks, only: [:index]
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
