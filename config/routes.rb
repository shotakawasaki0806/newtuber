Rails.application.routes.draw do
  devise_for :users
  root to: "videos#index"
  resources :users, only: [:edit, :update]
  resources :videos, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
end
