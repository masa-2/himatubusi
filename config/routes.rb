Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :topics, except: [:show] do
    collection do
      get :show 
    end
  end
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as: 'comments_create'
end