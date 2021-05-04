# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers:
    { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' },
                     path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  root to: 'pages#index'
  resources :books, only: %i[index show]
  resources :addresses, only: %i[new create]

  devise_scope :user do
    put 'update_email', to: 'users/registrations#update_email'
  end
end
