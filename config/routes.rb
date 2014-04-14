BulletproofPcr::Application.routes.draw do

  devise_for :users
  get "welcome/index"

  resources :complaints

  root 'welcome#index'
end
