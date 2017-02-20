Rails.application.routes.draw do
  root to: 'pages#home'
  resources :spas, only: [:index, :show, :new, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
