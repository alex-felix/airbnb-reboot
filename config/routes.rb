Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :events do
    resources :attendances, only: [:create]
  end
  resources :locations, only: [:index, :create, :new]
  root to: 'events#index'
  get 'contact', to: 'pages#contact'
end
