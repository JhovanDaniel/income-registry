Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'companies/:id/company_taxpayers', to: 'companies#company_taxpayers', as: :company_taxpayers
  get 'year_index', to: 'taxpayers#year_index'
  get 'inactive_taxpayers', to: 'taxpayers#inactive'
  get 'active_taxpayers', to: 'taxpayers#active'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :taxpayers
  resources :users
  resources :companies
  resources :years
end
