Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search_book" => "books#search_book"
  
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
   resources :book_comments, only: [:create,:destroy]
   resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' =>'relationships#followings', as:'followings'
      get 'followers' =>'relationships#followers', as:'followers'
      get 'search_created' => 'users#search'
  end
  
  get 'search' => 'searches#search'
  resources :chats, only: [:show, :create]
  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
   get "join" => "groups#join"
   get "new/mail" => "groups#new_mail"
   get "send/mail" => "groups#send_mail"
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
