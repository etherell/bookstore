# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :books, only: %i[index show]
end
