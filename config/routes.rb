Rails.application.routes.draw do
  devise_for :users
  root 'review#index'
  resources :review
  resources :products, only: :show
  resources :users, only: :show
end
