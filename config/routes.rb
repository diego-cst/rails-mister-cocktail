Rails.application.routes.draw do
  resources :cocktails, only: [:show, :create, :new] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]
  root 'cocktails#index'
end
