Rails.application.routes.draw do

  namespace :apps do
    root 'homes#index'
    get "category_search", to: "homes#category_search"

    get '/404', to: 'homes#error'
    get '/column/:id', to: "homes#show"
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

    # ユーザー作成時のパス
    resources :users, only: [:new, :create]

    # ユーザー作成時以外のパスを「user.name」にしたいため
    resources :users, only: [:show, :edit, :update, :destroy], param: :name do
      member do
        get :likes
      end
    end

    resources :diaries


    get 'user_todos'  => 'user_todos#index'
    get 'user_selected_todos'  => 'user_todos#selected'
    post 'user_todos' => 'user_todos#create'
  end

  namespace :admin do
    root 'users#home'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users
    resources :columns
    resources :todos
  end


end
