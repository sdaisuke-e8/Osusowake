Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show]
  resources :listings
  resources :listings do
    resources :reservations, only: [:create]
  end

end
