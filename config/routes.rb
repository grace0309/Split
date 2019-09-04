Rails.application.routes.draw do
  get 'deals/new'
  get 'deals/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :transactions, only: [ :create, :new]
    resources :messages, only: [ :index, :new, :create ]
  end

  resources :transactions, only: [ :show, :edit, :update, :destroy] do
    resources :reviews, only: [ :create, :new]
  end

  resources :deals, only: [:index]
  resources :reviews, only: [ :edit, :update, :destroy]
  get "/dashboard", to: "pages#dashboard", as: :dashboard

end
