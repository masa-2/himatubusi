Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  post 'pages/index' => 'pages#index'
  resources :topics
end