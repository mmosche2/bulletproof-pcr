BulletproofPcr::Application.routes.draw do

  devise_for :users
  get 'welcome/index'
  post '/account/AER_email' => 'welcome#update_notify_for_AER_for_agent'
  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'
  get '/account' => 'welcome#account', as: 'account'
  get '/product/get_skus' => 'products#get_skus'
  post '/return/sign_approval' => 'returns#sign_approval'
  get '/complaints/:complaint_id/print' => 'complaints#print', as: 'complaint_print'
  get '/returns/:return_id/print' => 'returns#print', as: 'return_print'
  delete '/complaints/:complaint_id/remove_image/:complaint_image_id' => 'complaints#remove_image', as: 'complaint_remove_image'
  resources :users_admin, controller: 'users'

  resources :complaints do
    resources :complaint_images
  end
  resources :returns
  resources :adverse_events, only: [:create, :update, :destroy]
  resources :contact_attempts, only: [:create, :update, :destroy, :edit]
  resources :products

  devise_scope :user do
    delete '/logout' => 'devise/sessions#destroy'
    get '/logout' => 'devise/sessions#destroy'
    get "/login" => "devise/sessions#new"
    get '/signup' => 'registrations#new'
  end

  root 'welcome#index'
end
