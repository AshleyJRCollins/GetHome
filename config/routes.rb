Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests, only: %i[index show new create] do
    resources :rides, only: :create
  end

  resources :rides do
    resources :reviews, only: %i[new create]
  end
end
