Rails.application.routes.draw do
  
  root 'homes#index'

  namespace :apps do
    root 'homes#index'
    get "category_search", to: "homes#category_search"

    get '/404', to: 'homes#error'
    get '/column/:id', to: "homes#show"
    get '/searched_column/:keyword', to: 'homes#searched_column', as: 'searched_column'
    get '/searched_column', to: 'homes#searched_column_all', as: 'searched_column_all'
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
    patch 'user_todos/:id/:status' => 'user_todos#update'
    get 'user_selected_todos'  => 'user_todos#selected'
    post 'user_todos' => 'user_todos#create'

    
    namespace :search do
      get 'column_search' => 'columns#search'
    end

  end

  namespace :admin do
    root 'users#home'
    get '/login', to: 'sessions#new'
    get 'columns_search' => 'columns#search'
    get 'todos_search' => 'todos#search'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users
    resources :columns
    resources :todos
  end

  
end
