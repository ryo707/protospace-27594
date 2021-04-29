Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  post 'prototypes/new' => 'new_prototype'
  resources :prototypes, only: [:new, :create, :index, :show, :update, :edit, :destroy]
  resources :comments, only: [:create]
  resources :users, only: [:show]
end
