# frozen_string_literal: true

Rails.application.routes.draw do
  resources :places, only: %i[new create]
  root to: 'home#show'
end
