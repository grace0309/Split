Rails.application.routes.draw do
  get 'deals/new'
  get 'deals/create'
  devise_for :users
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :transactions, only: [ :create, :new]
  end

  resources :transactions, only: [ :show, :edit, :update, :destroy]
  get "/dashboard", to: "pages#dashboard", as: :dashboard

end
