Rails.application.routes.draw do
devise_for :users
root to: 'homes#top'
get 'home/about' => 'homes#about'
resources :books,only: [:create, :index, :show, :destroy,:update,:edit]do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create,:destroy]
end
resources :users, only: [:show, :edit,:create,:index,:update]do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
end
resources :messages, only: [:create]
resources :rooms, only: [:create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
