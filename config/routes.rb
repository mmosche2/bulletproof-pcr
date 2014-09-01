BulletproofPcr::Application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'
  get '/account' => 'welcome#account', as: 'account'
  get '/product/get_skus' => 'products#get_skus'
  post '/return/sign_approval' => 'returns#sign_approval'

  resources :complaints
  resources :returns
  resources :adverse_events, only: [:create, :update, :destroy]
  resources :contact_attempts, only: [:create, :update, :destroy, :edit]
  resources :products, only: [:create, :destroy]

  devise_scope :user do
    delete '/logout' => 'devise/sessions#destroy'
    get '/logout' => 'devise/sessions#destroy'
    get "/login" => "devise/sessions#new"
    get '/signup' => 'registrations#new'
  end

  root 'welcome#index'
end
