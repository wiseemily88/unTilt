Rails.application.routes.draw do
  root :to => 'main#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/dashboard',  to: 'users#show'

  namespace :admin do
    get '/dashboard' => :index
    resources :users, only: [:new]
  end
end
