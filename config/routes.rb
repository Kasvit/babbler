# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'tweets#index'
  get :about, to: 'pages#about'

  resources :tweets
end
