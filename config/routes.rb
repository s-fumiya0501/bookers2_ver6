Rails.application.routes.draw do
devise_for :users
root to: 'homes#top'
get 'home/about' => 'homes#about'
resources :books,only: [:create, :index, :show, :destroy,:update,:edit]do
  resource :favorites, only: [:create, :destroy]
end
resources :users, only: [:show, :edit,:create,:index,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
