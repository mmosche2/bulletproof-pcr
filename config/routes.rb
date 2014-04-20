BulletproofPcr::Application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'
  get '/account' => 'welcome#account', as: 'account'

  resources :complaints
  resources :products, only: [:create, :destroy]

  root 'welcome#index'
end
