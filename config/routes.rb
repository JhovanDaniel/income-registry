Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'active', to: 'taxpayers#active'
  get 'inactive', to: 'taxpayers#inactive'
  get 'year_index', to: 'taxpayers#year_index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :taxpayers
  resources :users
  resources :companies
end
