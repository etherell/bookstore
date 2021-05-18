# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root to: 'pages#index'
  resources :books, only: %i[index show]
  resources :addresses, only: %i[new create]

  devise_scope :user do
    put 'update_email' => 'users/registrations#update_email'
  end
end
