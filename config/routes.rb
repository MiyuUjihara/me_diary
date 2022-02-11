Rails.application.routes.draw do

  namespace :apps do
    root 'homes#index'
    get "category_search", to: "homes#category_search"

    get '/404', to: 'homes#error'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users, only: [:new, :create, :index,]
    resources :users, only: [:show, :edit, :update, :destroy], param: :name
    resources :diaries
  end

  namespace :admin do
    root 'users#home'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users
    resources :columns
  end


end
