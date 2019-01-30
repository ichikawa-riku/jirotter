Rails.application.routes.draw do
  devise_for :users
  root 'review#index'
  resources :review
end
