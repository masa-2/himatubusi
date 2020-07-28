Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end