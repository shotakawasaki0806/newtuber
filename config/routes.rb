Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "videos#index"
  resources :users, only: [:edit, :update, :show]
  resources :videos, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    member do
      get 'category'
    end
  end
end
