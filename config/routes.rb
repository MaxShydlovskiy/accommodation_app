Rails.application.routes.draw do
  resources :users, param: :_email
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  resources :accommodations
  resources :reservations
end
