Rails.application.routes.draw do
  resource :users, only: [:index, :show]
  resource :books, only: [:new, :create, :index, :show]
  root to: 'homes#top', as: 'top'
  devise_for :users
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end