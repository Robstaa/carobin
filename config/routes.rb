# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#show'
  resources :visits, only: %i[new create]
  resources :places, only: %i[new create]
end
