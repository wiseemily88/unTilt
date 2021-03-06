Rails.application.routes.draw do
  get    '/',        to: 'sessions#new', as: 'root'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/dashboard',  to: 'users#show'
  post 'admin/notification' => 'admin/notification#create'


  namespace :admin do
    get '/dashboard' => :index
    resources :users, only: [:new, :create, :index, :show]
    resources :interviews, only: [:index, :show, :new, :create, :edit, :update]
    resources :candidates, only: [:index, :show, :new, :create]
    resources :competencies
  end

  resources :users, only: [:new, :create, :edit, :update]
  resources :interviews, only: [:edit, :update, :index]
end
