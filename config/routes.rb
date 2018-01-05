Rails.application.routes.draw do
  get    '/',        to: 'sessions#new', as: 'root'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/dashboard',  to: 'users#show'


  namespace :admin do
    get '/dashboard' => :index
    resources :users, only: [:new, :create, :index, :show]
    resources :interviews, only: [:index, :show, :new, :create]
  end

  resources :users, only: [:new, :create]
end
