Rails.application.routes.draw do
  root to: 'pages#home'
  resources :spas, only: [:index, :show, :new, :create]  do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :destroy, :update]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  namespace :admin do
    resources :spas, only: [:index, :edit, :update] do
      resources :bookings, only: [:index]
    end
  end
  get '/style', to: 'pages#style_guide'
end
