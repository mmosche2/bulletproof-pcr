BulletproofPcr::Application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'

  resources :complaints

  root 'welcome#index'
end
