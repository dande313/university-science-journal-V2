Rails.application.routes.draw do
  resources :comments
  resources :topics
  resources :article_topics
  resources :article_resources
  resources :articles
  resources :departments, only: [:show, :index]
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
              :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:show]
  root "home#index"
  get '/articles/:id', to: 'articles#show'
  get '/articles/:id/destroy', to: 'articles#destroy'
  get '/department/:id', to: 'departments#show'
  get '/articles/:id/topics/new', to: 'topics#new'
  get '/topics/:topic_id/articles', to: 'articles#index'
end
