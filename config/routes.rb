# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :events do
    resources :attendances, only: [:create]
  end
  root to: 'pages#index'
  get 'contact', to: 'pages#contact'

  get '/dashboards', to: 'dashboards#index'

  get '/profiles/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile
  resources :profiles, only: :show
end
