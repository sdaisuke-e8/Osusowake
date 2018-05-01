Rails.application.routes.draw do
  root 'pages#home'
  get '/search' => 'pages#search'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show]
  resources :listings
  resources :listings do
    resources :reservations, only: [:create, :destroy]
  end
  get 'reservations/index'

  resources :listings do
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get '/ajaxsearch' => 'pages#ajaxsearch'

end
