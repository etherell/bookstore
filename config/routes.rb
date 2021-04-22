# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' },
                     path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  root to: 'pages#index'
  resources :books, only: %i[index show]
end
