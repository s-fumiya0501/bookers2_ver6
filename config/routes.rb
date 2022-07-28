Rails.application.routes.draw do
devise_for :users
root to: 'homes#top'
get 'home/about' => 'homes#about'
resources :books,only: [:create, :index, :show, :destroy,:update,:edit]do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create,:destroy]
end
resources :groups do
  get "join" => "groups#join"
  get "new/mail" => "groups#new_mail"
  get "send/mail" => "groups#send_mail"
end
resources :users, only: [:show, :edit,:create,:index,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
